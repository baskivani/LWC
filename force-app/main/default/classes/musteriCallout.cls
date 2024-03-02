global class musteriCallout {
    
    global static final string API_ENDPOINT = 'https://gorest.co.in/public/v2/users/';
    global static final string myToken = 'Bearer 21e4ff1d98cd4bf8a4e682ddaacb0902bc23a63a8882829209d7f558d9e4e115';
    
/****************************************************************************************************************/    
    //@future callout metodlarinda future methodu kullanıyoruz. Ama future methodu icinde system.debug calismiyor.
   //Bu method calisti
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
/****************************************************************************************************************/    
      
    //Bu method calisti
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
    
/****************************************************************************************************************/    
	//Bu method calisti
    global static void butunMusterileriAlVeKaydet (){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT);
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            string jsonStrList =response.getBody();
            system.debug(jsonStrList);
            List<MusteriContainer> jsonMusteriList = (List<MusteriContainer>)JSON.deserialize(jsonStrList,List<MusteriContainer>.class);
            List <Musteri__c> musteriList = new List<Musteri__c>();
            for (MusteriContainer mst :jsonMusteriList ){
                Musteri__c newRecord = new Musteri__c();
                newRecord.GoRestId__c = mst.id;
                newRecord.name=mst.name;
                newRecord.Gender__c = mst.gender;
                newRecord.Status__c = mst.status;
                newRecord.Email__c = mst.email;
                musteriList.add(newRecord);
            }
            insert musteriList;
            system.debug(musteriList.size()+ 'adet record database e kaydedildi');
        } else {
            system.debug(response.getStatus());
        }
    }
    
/****************************************************************************************************************/    
    //Bu method calisti
    global static void TekMusteriAlVeKaydet (string musteriId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT+musteriId);
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            string jsonStr = response.getBody();
            MusteriContainer mst = (MusteriContainer)JSON.deserialize(jsonStr,MusteriContainer.class);
            Musteri__c newRecord = new Musteri__c();
            newRecord.GoRestId__c = mst.id;
            newRecord.name=mst.name;
            newRecord.Gender__c = mst.gender;
            newRecord.Status__c = mst.status;
            newRecord.Email__c = mst.email;
            insert newRecord;
        } 
        else {
            system.debug(response.getStatus());
        }
    }
    
/****************************************************************************************************************/    
     //Bu method calisti
    global static void MusterileriIsmeGoreAlVeKaydet (String musteriName){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT+'?name='+musteriName);
        request.setHeader('Content-Type','application/Json;charset=UTF-8');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode()==200){
            string jsonStrList =response.getBody();
            system.debug(jsonStrList);
            List<MusteriContainer> jsonMusteriList = (List<MusteriContainer>)JSON.deserialize(jsonStrList,List<MusteriContainer>.class);
            List <Musteri__c> musteriList = new List<Musteri__c>();
            for (MusteriContainer mst :jsonMusteriList ){
                Musteri__c newRecord = new Musteri__c();
                newRecord.GoRestId__c = mst.id;
                newRecord.name=mst.name;
                newRecord.Gender__c = mst.gender;
                newRecord.Status__c = mst.status;
                newRecord.Email__c = mst.email;
                musteriList.add(newRecord);
            }
            insert musteriList;
            system.debug(musteriList.size()+ 'adet record database e kaydedildi');
        } else {
            system.debug(response.getStatus());
        }
    }
 /****************************************************************************************************************/    
  	// Bu kod calismadi, Postman de calıstigi halde burda calismadi.
    global static void MusterileriIsmeGoreBodyIleAlVeKaydet (String musteriName){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(API_ENDPOINT);
        string body = '{"name":"'+musteriName+'"}';
        request.setHeader('Authorization',myToken);
        request.setHeader('Content-Type','application/Json;charset=UTF-8');
        request.setBody(body);
        HttpResponse response = http.send(request);
       system.debug(response.getStatusCode());
        if(response.getStatusCode()==200){
            string jsonStrList =response.getBody();
            system.debug(jsonStrList);
            List<MusteriContainer> jsonMusteriList = (List<MusteriContainer>)JSON.deserialize(jsonStrList,List<MusteriContainer>.class);
            List <Musteri__c> musteriList = new List<Musteri__c>();
            for (MusteriContainer mst :jsonMusteriList ){
                Musteri__c newRecord = new Musteri__c();
                newRecord.GoRestId__c = mst.id;
                newRecord.name=mst.name;
                newRecord.Gender__c = mst.gender;
                newRecord.Status__c = mst.status;
                newRecord.Email__c = mst.email;
                musteriList.add(newRecord);
            }
            insert musteriList;
            system.debug(musteriList.size()+ 'adet record database e kaydedildi');
        } else {
            system.debug(response.getStatus());
        }
    }
 /****************************************************************************************************************/    
   
 
}