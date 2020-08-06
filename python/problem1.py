serverName=["Database","application1","application2"]
insertstrem="10.1.0.10,10.4.0.20,10.4.0.21"
#print(serverName[0]+" "+ "is " +insertstrem[3])
ip=insertstrem.split(",")
#print(ip)
print("#" * 20)
print(serverName[0] + "is " + ip[2])
print(serverName[1] + "is " + ip[1])
print(serverName[2] + "is " + ip[0])

