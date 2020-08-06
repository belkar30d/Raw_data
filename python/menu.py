print("         MENU      ")
iteam = input("Enter YOur Menu name  :- ")
iteam_p = float(input("Enter Menu price %s:- " % iteam))
iteam_q = int(input("Enter Nos. of menu item:- "))
print("#" * 10)
print("         MENU      ")

print("1.-------> %s: %.2f" %(iteam,iteam_p))
print("&" * 10)
print("      qunatuty consumed      ")
print("1.------> %s ---> %d" %(iteam, iteam_q))
bi=float((iteam_p*iteam_q))
print("#" * 10)
print("Total bill:- %.2f" %(bi))
#print("Total Bill :- ((%d * %d))" %(iteam_p, iteam_q))


