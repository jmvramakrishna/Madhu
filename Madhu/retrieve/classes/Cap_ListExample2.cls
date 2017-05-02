public class Cap_ListExample2 {
    public List<SelectOption> options  {set;get;}
    public Cap_ListExample2(){
        options=new List<SelectOption>();
        SelectOption n=new SelectOption('none','-None-');
        options.add(n);
        List<String> cities=new List<String>{'Ban','Che','Hyd'};
        for(String s: cities){
             SelectOption op=new SelectOption(s,s);
             options.add(op);
        }
    }
}