global class musteriCallout {
    
    global static final string API_ENDPOINT = 'https://gorest.co.in/public/v2/users/';
    global static final string myToken = 'Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    
    //@future callout metodlarinda future methodu kullanıyoruz. Ama future methodu icinde system.debug calismiyor.
    global static void butunMusterileriAl (){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT);
        HttpResponse response = http.send(request);
      
        if(response.getStatusCode()==200){
            system.debug(response.getBody());
        } else {
            system.debug(response.getStatus());
        }
        
        
    }
global static void TekMusteriAl (string musteriId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT+musteriId);
        HttpResponse response = http.send(request);
      
        if(response.getStatusCode()==200){
            system.debug(response.getBody());
        } else {
            system.debug(response.getStatus());
        }
        
        
    }

    global static void butunMusterileriAlVeKaydet (){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT);
        HttpResponse response = http.send(request);
      
        if(response.getStatusCode()==200){
            system.debug(response.getBody());
        } else {
            system.debug(response.getStatus());
        }
        
        
    }
}