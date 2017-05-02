public class DynamicSoql1 {
    public List<Account> accs {set;get;}
    public String accName     {set;get;}
    public void getData(){
        String query='select name,industry,phone from Account' ;
        if(accName!='' && accName!=null){
            query=query+' where name like \''+accName+'%\'';
        }
        accs=Database.query(query);
    }
}