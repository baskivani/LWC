public class CaseCalloutManager {

     // hata alan arkadaslar icin IHTIYAC HALINDEKULLANACAGIZ
   	Private static final String API_ENDPOINT= 'https://wisequarter69-dev-ed.develop.my.salesforce.com/services/apexrest/cases';
    private static FINAL string TOKEN ='Bearer !AR8AQDc73kAINUVrvu3UMpglrBHuojq8gl9R1jbxvK7_mLna33izUA34ELp8RZylKk8ZZA.EeblEku598AuUVfS25erBqJkg';
    private static final String API_ENDPOINT2 ='callout:OrgAToOrgBNamed/services/apexrest/cases/';
    
    
    public Static Void butunCaseleriAL(){
        
        HTTP http = new HTTP();        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT);
        request.setHeader('Authorization',TOKEN); 
        request.setHeader('Content-Type', 'application/json; charset=utf-8');  
        HttpResponse response = http.send(request);
        
        
        system.debug('response >>> ' + response); 
        system.debug('getStatus() >>> ' + response.getStatus()); 
        system.debug('getHeaderKeys() >>> ' + response.getHeaderKeys());
        system.debug('getHeader(key)) >>> ' + response.getHeader('Content-Type'));
        system.debug('getStatusCode() >>> ' + response.getStatusCode());
        system.debug('getBody() >>> ' + response.getBody());
        
    }
    
    
    public Static Void butunCaseleriNamedCredentialAL(){
        
        HTTP http = new HTTP();        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:OrgAToOrgBNamed/services/apexrest/cases/');
        request.setHeader('Content-Type', 'application/json; charset=utf-8');  
        HttpResponse response = http.send(request);
        
        system.debug('getBody() >>> ' + response.getBody());
        
        // OGRENDIGINIZ EN GELISMIS YONTEM 
        //  provider bana JSON formatinda bir array gonderiyor  
        /* [
{"attributes":{"type":"Case","url":"/services/data/v60.0/sobjects/Case/500Hu000029yWvIIAU"},
"Id":"500Hu000029yWvIIAU",
"CaseNumber":"00001028",
"Origin":"Phone",
"Priority":"High",
"Reason":"Equipment Complexity",
"Subject":"bu record PUT ile update edildi"} ,,, .... ]

*/
        list<object> gelenJson =   (list<object>)JSON.deserializeUntyped(response.getBody());
        
        list<case> caseList = new List<case>();
        for( object  obj: gelenJson  ){
            Map<String,Object> caseProps = (map<String,Object>) obj;   
            
            case newCase = new Case();
            newCase.Subject = String.valueOf(caseProps.get('Subject')) ; // 1. yontem
            newCase.Origin = (String)caseProps.get('Origin') ;     // 2. yontem
            newCase.Priority = caseProps.get('Priority').toString(); // 3. yontem
            newCase.Reason = String.valueOf(caseProps.get('Reason')) ;
            // newCase.GelenId__c = String.valueOf(caseProps.get('Id'));
            //newCase.GelenCaseNum__c     = (string)caseProps.get('CaseNumber');
            caseList.add(newCase);
            
        }
        
        insert caseList;      
        
        
        
    }  
    
    public static void DeleteRecordById (String CaseId){
        
        Http http = new Http ();
        HttpRequest request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndpoint(API_ENDPOINT2+CaseId);
        HttpResponse response = http.send(request);
        
      string payload =response.getBody();
        system.debug(payload);
    // Case silinenRecord = (Case)JSON.deserialize(payload,case.class);
       //system.debug(silinenRecord);

        
    }
    
    public static void SaveRecord (){
        
        Http http = new Http ();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint(API_ENDPOINT2);
        String payload = '{"Origin":"Phone",  "Priority":"High", "Reason":"Equipment Complexity", "Subject":"Bu record Post ile olusturuldu"}'; 
        request.setBody(payload);
        request.setHeader('Content-Type', 'application/json; charset=utf-8');  
        HttpResponse response = http.send(request);
        
      string gelenCevap =response.getBody();
        system.debug(gelenCevap);
    // Case silinenRecord = (Case)JSON.deserialize(payload,case.class);
       //system.debug(silinenRecord);

        
    }
}