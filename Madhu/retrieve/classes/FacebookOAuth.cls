public class FacebookOAuth {
    public string clientId     {set;get;}
    public String clientSecret   {set;get;}
    public string result     {set;get;}
    public void getToken(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        String url='https://graph.facebook.com/oauth/access_token?';
        url=url+'client_id='+clientId;
      url=url+'&client_secret='+clientsecret;
      url=url+'&grant_type=client_credentials';
        request.setEndPoint(url);
        request.setMethod('GET');
        HttpResponse response =p.send(request);
        result=response.getBody();
    }
}