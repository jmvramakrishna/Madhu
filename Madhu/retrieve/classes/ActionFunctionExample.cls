public class ActionFunctionExample {
    public String name    {set;get;}
    public String branch {set;get;}
    public String result {set;get;}
    public Decimal salary {set;get;}
    public void callme(){
        result='Name :'+name+': branch :'+branch+': Salary :'+salary;
    }
}