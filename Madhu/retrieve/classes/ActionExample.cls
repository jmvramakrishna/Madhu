public class ActionExample {
    public Account acc {set;get;}
    public ActionExample(ApexPages.StandardController controller){
        String[] fields=new String[]{'name','Industry','Phone'};
        controller.addFields(fields);
        acc=(Account)controller.getRecord();
    }
}