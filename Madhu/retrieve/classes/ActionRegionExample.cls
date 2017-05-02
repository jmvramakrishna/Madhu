public class ActionRegionExample {
   public String name    {set;get;}
    public String branch {set;get;}
    public String result {set;get;}
   
    public void callme(){
        result='Name :'+name+': branch :'+branch;
    }
}