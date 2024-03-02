public class LeadCalloutManager {
		public static final string END_POINT ='callout:OrgAToOrgBNamed/services/apexrest/lead/';
    
    public static void getLeads(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndPoint(END_POINT) ;
        request.setHeader('Content-Type', 'application/json; charset=utf-8');  
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
    }
}