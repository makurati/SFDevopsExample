public with sharing class PS_CurrencyAPIService {
    
    public static void getExchangeRates(){
       try{
            
            /*Step-1 prepare the request */
        HttpRequest httpReq=new HttpRequest();
        httpReq.setEndpoint('https://open.er-api.com/v6/latest/USD');
        
        /*step-1.2- set headers*/
        httpReq.setHeader('Content-Type','application/json');
        httpReq.setHeader('Accept','application/json');
        
        /*step-1.3- set method */
        httpReq.setMethod('GET');
        
        /*step-2- send the request */
        Http http =new Http();
         
        httpResponse httpRes=http.send(httpReq);
        
        /*step-3-Print the response */
        
        String responseBody=httpRes.getBody();
        Integer statusCode= httpRes.getStatusCode();
        String status=httpRes.getStatus();
        System.system.debug('The response from API-'+responseBody );
        system.debug('The response from API-'+statusCode );
        system.debug('The response from API-'+status );
      
            
        } catch(System.Exception ex){
            System.debug('Exception Executed ... '+ ex.getStackTraceString());
            
        }
        
        
        
    }

}