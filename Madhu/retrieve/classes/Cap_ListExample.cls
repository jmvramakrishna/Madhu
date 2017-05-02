public class Cap_ListExample {
    public String name       {set;get;}
    public List<String> empNames {set;get;}
    public Account acc       {set;get;}
    public List<Account> accList {set;get;}
    public Boolean flag1     {set;get;}
    public Boolean flag2     {set;get;}
    public Cap_ListExample(){
        empNames=new List<String>();
        accList=new List<Account>();
        flag1=true;
        flag2=false;
        acc=new Account();
    }
    public void addName(){
        empNames.add(name);
        name=null;
        flag1=true;
        flag2=true;
    }
    public void addAcc(){
        accList.add(acc);
        acc=new Account();
        flag1=true;
        flag2=true;
    }
}