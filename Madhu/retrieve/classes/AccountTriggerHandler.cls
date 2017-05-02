/*
 *  UseCase 1: 

Object   : Account 

Logic   : a. When a new Account is created with Industry as Banking then set 

    1. Owner as JRama 

    2. Ownership as public 

     b. If the AnnualRevenue is more than 10 Lacs then add wilson as AccountTeamMember with 
        
    Role      : AccountManager

    Permission : Read

    Note : 1. Enable AccountTeam 

    Setup
      |---Build
      |---Customize
          |---AccountTeams
            |---Enable 


    1. Check the Team Roles  and Modify if needed.

    2. Add AccountTeamMembers to all the pageLayouts

    Note : 2: Field of AccountTeamMeber 

      AccountId : Id of the Account on which we want to create AccountTeamMember 

      Userid    : Id of the User whom we want to create as AccountTeamMember 

      AccountAccessLevel : Type of Access Possible values (Read ,Edit,All)

      TeamMemberRole : Role of the AccountTeamMember 


  c. When ever Account Phone no is modified  Update the Corresponding Contacts  otherPhone ,mobile

    OtherPhone as Accounts Old Phone number 

    MobilePhone as Account new Phone number 


*/
public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> accs){
        User u=[select id from user where alias='JRama'];
        for(Account a : accs){
            if(a.industry=='Banking'){
                a.ownerId=u.id;
                a.ownerShip='Public';
            }
        }
    }
    public static  void afterInsert(List<Account> accs){
        List<AccountTeamMember> teams=new List<AccountTeamMember>();
        User u=[select id from user where alias='JRama'];
        for(Account a: accs){
            if(a.AnnualRevenue > 1000000) {
                AccountTeamMember  atm=new AccountTeamMember();
                atm.AccountId=a.Id;
                atm.UserId=u.id;
                atm.AccountAccessLevel='Read';
                atm.TeamMemberRole='Account Manager';
                teams.add(atm);
            }
        }
        insert teams;
    }
    public static void beforeUpdate(Map<Id,Account> oldMap,Map<Id,Account> newMap){
        List<Id> modifiedList=new List<Id>();
        for(Id key : oldMap.keySet()){
            Account old=oldMap.get(key);
            Account newAcc=newMap.get(key);
            if(old.Phone !=newAcc.Phone){
                modifiedList.add(key);
            }
        }
        List<Contact> cons=[select id,OtherPhone,MobilePhone,AccountId  from Contact where AccountId in: ModifiedList];
        for(Contact c:cons){
            Account oldAccount=oldMap.get(c.accountId);
            Account newAccount=newMap.get(c.accountId);
            c.otherPhone=oldAccount.Phone;
            c.MobilePhone=newAccount.Phone;
        }
        update cons;
        
    }
}