public class AccountNewPage {
    public Account acc {set;get;}
    public AccountNewPage(Apexpages.StandardController controller){
        acc=(Account)controller.getRecord();
       
    }
    public PageReference create(){
         Integer count=[select count() from Account where name=:acc.name];
        if(count>0){
            Apexpages.Message msg=new ApexPages.Message(ApexPages.Severity.Error,'Duplicate Record Exits');
            Apexpages.addmessage(msg);
            return null;
        }else{
            insert acc;
            PageReference p=new PageReference('/'+acc.id);
            return p;
        }
    }
}