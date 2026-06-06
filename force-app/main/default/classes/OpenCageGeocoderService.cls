public class OpenCageGeocoderService {
    
    public static void reverseGeocoding(String accountId){
        
         Account accRecord=[Select id,Location__Latitude__s,Location__Longitude__s 
                           from Account
                            where id=:accountId and Location__Latitude__s!=null and Location__Longitude__s!=null
                           limit 1];
        
        String queryParam=accRecord.Location__Latitude__s+','+accRecord.Location__Longitude__s;
            
            /*Step-1 prepare the request */
        HttpRequest httpReq=new HttpRequest();
        httpReq.setEndpoint(System.label.OpenCage_API_URL+'?q='+queryParam+'&key='+System.label.OpenCage_API_Key+'&pretty=1');
        
        /*step-1.2- set headers*/
        httpReq.setHeader('Content-Type','application/json');
        httpReq.setHeader('Accept','application/json');
        
        /*step-1.3- set method */
        httpReq.setMethod('GET');
        
        /*step-2- send the request */
        Http http =new Http();
        
        try{
        httpResponse httpRes=http.send(httpReq);
        
        /*step-3-Print the response */
        
        String responseBody=httpRes.getBody();
        Integer statusCode= httpRes.getStatusCode();
        String status=httpRes.getStatus();
        System.system.debug('The response from openCage API-'+responseBody );
        system.debug('The response from openCage API-'+statusCode );
        system.debug('The response from openCage API-'+status );
      
            
        } catch(System.Exception ex){
            System.debug('Exception Executed ... '+ ex.getStackTraceString());
            
        }
        
        
      
    }

}