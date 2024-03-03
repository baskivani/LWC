public class OpportunityCalloutManager {
		public static final string END_POINT ='callout:OrgAToOrgBNamed/services/apexrest/opportunities/';
    
    public static void DeleteOpportunityById(String OppId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndPoint(END_POINT+OppId) ;
        request.setHeader('Content-Type', 'application/json; charset=utf-8');  
        HttpResponse response = http.send(request);
        system.debug(response.getBody());
    }

}