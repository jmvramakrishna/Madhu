public class DMLExample1 {
    public String accName     {set;get;}
    public String accIndustry   {set;get;}
    public String lastName    {set;get;}
    public String firstName    {set;get;}
    public Opportunity opp    {set;get;}
    public DMLExample1(){
        opp=new Opportunity();
    }
    public PageReference create(){
        Integer count=[select count() from Account where name=:accName];
        if(count>0){
           ApexPages.Message msg=new Apexpages.Message(Apexpages.Severity.WARNING,'Duplicate Account Exists with '+accName+' Name');
           Apexpages.addMessage(msg);
           return null;
        }else{
          Account acc=new Account();
          acc.Name=accName;
          acc.Industry=accIndustry;
          insert acc;
          Contact con=new Contact();
          con.accountId=acc.Id;
          con.LastName=lastname;
          con.FirstName=firstName;
          insert con;
          opp.AccountId=acc.Id;
          opp.closeDate=System.today()+15;
          opp.stageName='Prospecting';
          insert opp;
          PageReference p=new PageReference('/'+acc.id);
          return p;
        }
    }
}