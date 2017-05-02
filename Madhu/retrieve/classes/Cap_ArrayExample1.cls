public class Cap_ArrayExample1 {
    public String[] names {set;get;}
    public Account[] accs  {set;get;}
    public Cap_ArrayExample1(){
        names=new String[]{'Sam','Ram','Kiran'};
        accs=new Account[5];
        Account a1=new Account();
        a1.Name='TCS';
        a1.Phone='123';
        Account a2=new Account();
        a2.Name='Wipro';
        a2.Phone='344';
        accs[0]=a1;
        accs[1]=a2;
    }
}