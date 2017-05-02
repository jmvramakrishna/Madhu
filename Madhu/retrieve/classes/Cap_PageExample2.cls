public class Cap_PageExample2 {
    public string name     {set;get;}
    public String branch   {set;get;}
    public Cap_PageExample2(){
        name=ApexPages.currentPage().getParameters().get('name');
        branch=Apexpages.currentPage().getParameters().get('branch');    
    }
}