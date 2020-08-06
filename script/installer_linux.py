#!/usr/bin/env python
# This script should be run via sudo.
# COPYRIGHT (c) 2013-2016. THIS CODE AND THE SOFTWARE WHICH SUCH CODE RELATES TO
# (COLLECTIVELY THE "SOLUTION") ARE PROTECTED BY COPYRIGHT OWNED BY CLOUDENDURE LTD.
# ("CLOUDENDURE"). NO PART OF THE SOLUTION MAY THEREFORE BE COPIED, DUPLICATED,
# REPRODUCED, REPUBLISHED, RE-DISSEMINATED, CHANGED, ALTERED, LOANED, LICENSED,
# TRANSFERRED, DISTRIBUTED OR OTHERWISE DISCLOSED TO ANY THIRD PARTY WITHOUT THE
# PRIOR WRITTEN CONSENT OF CLOUDENDURE. THIS CODE MUST BE USED SOLELY FOR THE
# INTENDED PURPOSE FOR WHICH IT WAS PROVIDED TO YOU IN CONNECTION WITH CLOUDENDURE'S
# SOFTWARE, AND SHOULD NOT BE USED FOR ANY OTHER PURPOSE.

# CLOUDENDURE MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED, OR STATUTORY,
# INCLUDING BUT NOT LIMITED TO ALL WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT
# OF THIRD PARTY'S INTELLECTUAL PROPERTY OR FITNESS FOR A PARTICULAR PURPOSE,
# RELATED TO THE SOLUTION. ANY USE OF THE SOLUTION, OR ANY PART THEREOF, AND ANY
# USE OR RELIANCE ON ANY OUTPUT RESULTING FROM USE OF THE SOLUTION IS AT THE USER'S
# SOLE RISK.

# IN NO EVENT WILL CLOUDENDURE BE LIABLE TO ANY USER OF THE SOLUTION OR ANY PART
# THEREOF, AND ANY OUTPUT RESULTING FROM USE OF THE SOLUTION FOR ANY DAMAGES
# WHATSOEVER, DIRECT OR INDIRECT, SPECIAL, CONSEQUENTIAL OR SIMILAR DAMAGES,
# INCLUDING ANY LOST PROFITS, REVENUES, GOODWILL OR LOST DATA ARISING OUT OF THIS
# AGREEMENT, THE USE OR INABILITY TO USE THE SOLUTION, THE PERFORMANCE OF THE
# SOLUTION, EVEN IF CLOUDENDURE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
# DAMAGES.

import sys
import os
import subprocess
import stat
import tempfile
import shutil


# Though it would be cleaner to use namedtuple here, python 2.4 does not support it, so we use a class
class DF(object):  # pylint: disable=too-few-public-methods
    def __init__(self, filesystem, blocks, used, available, capacity, mounted_on):
        self.filesystem = filesystem
        self.blocks = blocks
        self.used = used
        self.available = available
        self.capacity = capacity
        self.mounted_on = mounted_on


LOCAL_INSTALLER = "./cloudendure_installer"
IS_PYTHON2 = sys.version_info[0] == 2

REQUIRED_DISK_SPACE = 500 * 1024 * 1024


def main():

    print("The installation of the CloudEndure Agent has started.")  # pylint: disable=superfluous-parens

    if IS_PYTHON2:
        from urllib2 import urlopen  # pylint: disable=no-name-in-module,import-error
        if sys.maxint > (2**31):  # pylint: disable=no-member
            arch = 64
        else:
            arch = 32
    else:
        from urllib.request import urlopen  # pylint: disable=no-name-in-module,import-error
        if sys.maxsize > (2**31):
            arch = 64
        else:
            arch = 32

    print("Running the Agent Installer for a " + str(arch) + " bit system...")  # pylint: disable=superfluous-parens

    try:
        handle_noexec_tmp()
    except Exception:  # pylint: disable=broad-except
        pass

    doing = ""
    try:
        doing = 'checking disk free space'
        if not check_free_space(REQUIRED_DISK_SPACE):
            print('Not enough available disk space, exiting.')  # pylint: disable=superfluous-parens
            return -1

        doing = "preparing installer download url"
        url = "https://console.cloudendure.com/api/v5/static/installer_linux" + str(arch)

        doing = "downloading installer"

        content = urlopen(url).read()
        open(LOCAL_INSTALLER, "wb").write(content)

        doing = "preparing installer to run"
        currentStat = os.stat(LOCAL_INSTALLER).st_mode
        os.chmod(LOCAL_INSTALLER, currentStat | stat.S_IEXEC)

        doing = "running installer"
        return subprocess.call([LOCAL_INSTALLER] + sys.argv[1:])

    except Exception:  # pylint: disable=broad-except
        # We have to retrieve exception info this way due to the need to remain
        # compatible with both Python 2.4 and Python 3.6
        _, e, _ = sys.exc_info()
        if doing == "downloading installer":
            # pylint: disable=line-too-long, superfluous-parens
            print('''Connecting to console.cloudendure.com on port 443 failed.
This is usually caused by lack of routing to console.cloudedure.com, firewall configuration (local or in a firewall appliance) or incorrect web proxy configuration on this server. 
Please resolve the connectivity issue and run the installer again.
For further assistance, please contact CloudEndure support at https://bit.ly/2T54hSc''')
        else:
            print("Error " + doing + "! Please contact CloudEndure support at https://bit.ly/2T54hSc")  # pylint: disable=superfluous-parens

        print("Error details: " + str(e))  # pylint: disable=superfluous-parens
        return -1


def check_free_space(required):
    fs = get_fs('.')
    return required <= int(fs.available) * 1024     # the fields are in 1024-blocks


def handle_noexec_tmp():
    # get tempdir
    tmpdir = tempfile.gettempdir()
    if tmpdir == os.getcwd():
        return

    # get mountpoint of tempdir
    tmpfs = get_fs(tmpdir)
    if not tmpfs:
        return
    mountpoint = tmpfs.mounted_on

    # check fs flags for 'noexec'
    flags = ''
    f = open('/etc/mtab')
    try:
        lines = [l.split() for l in f.readlines()]
        for line in lines:
            if line[1] == mountpoint:
                flags = line[3]
                break
    finally:
        f.close()

    if 'noexec' not in flags:
        return

    # tmpdir is no noexec fs, use alternate tmp dir
    alternate_tmpdir = '/var/lib/cloudendure/.tmp_install'
    if os.path.isdir(alternate_tmpdir):
        shutil.rmtree(alternate_tmpdir)

    os.makedirs(alternate_tmpdir)

    for var in ['TEMP', 'TMP', 'TMPDIR']:
        os.environ[var] = alternate_tmpdir


def get_fs(directory):
    """
    get filesystem data for a directory as in 'df -P' command and parse the result
    :type directory: str
    :rtype DF # namedtuple('DF', 'filesystem blocks used available capacity mounted_on')
    """
    p = subprocess.Popen(["df", "-P", directory], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, _ = p.communicate()
    if p.returncode != 0:
        return None

    res = out.splitlines()[-1]   # take the last line
    return DF(*res.split())


if __name__ == '__main__':
    ret = main()
    sys.exit(ret)
