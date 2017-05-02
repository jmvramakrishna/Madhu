public class BoxOAuth {
    public string clientId     {set;get;}
    public String clientSecret   {set;get;}
    public String code      {set;get;}
    public String redirectUrl  {set;get;}
    public string accessToken  {set;get;}
    public String jsonString  {set;get;}
    public String result    {set;get;}
    public BoxOAuth(){
        redirectUrl='https://c.ap2.visual.force.com/apex/BoxEx';
    }
    public PageReference getMyCode(){
        String url='https://account.box.com/api/oauth2/authorize?';
        url=url+'response_type=code&client_id='+clientId+'&redirect_uri='+redirectUrl+'&state=abdcc';
        PageReference p=new PageReference(url);
        return p;
    }
    public void load(){
        code=Apexpages.currentpage().getparameters().get('code');
    }
   public void getToken(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('https://api.box.com/oauth2/token');
        String body='grant_type=authorization_code&';
        body=body+'client_secret='+clientsecret;
        body=body+'&client_id='+clientId;
        body=body+'&redirect_uri='+redirectUrl;
        body=body+'&code='+code;
        request.setMethod('POST');
        request.setBody(body);
        HttpResponse response=p.send(request);
        jsonString=response.getBody();
         System.JSONParser jp=JSON.createParser(jsonString);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
    }
    public void createFolder(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('POST');
        request.setEndPoint('https://api.box.com/2.0/folders');
        String body='{"name":"Integration88", "parent": {"id": "0"}}';
        request.setBody(body);
        request.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response=p.send(request);
        result=response.getBody();
    }
}