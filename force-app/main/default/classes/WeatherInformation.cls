/**
 * @description       : 
 * @author            : Tanishka
 * @group             : 
 * @last modified on  : 12-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class WeatherInformation {
    @AuraEnabled(cacheable=true)
    public static String getTemp(String city){
        try{
            if(String.isNotEmpty(city)){
                Http http = new Http();
                HttpRequest request = new HttpRequest();
                request.setEndpoint('http://api.weatherapi.com/v1/current.json?key=650a03de7261407bae9100614232407&q='+city+'&aqi=no');
                request.setMethod('GET'); //650a03de7261407bae9100614232407
                HttpResponse response = http.send(request);
                response.getStatusCode();
                if(response.getstatusCode() == 200){
                    system.debug('response--->'+response.getBody());
                    return response.getBody();
                }
                else if(response.getstatusCode() == 400){
                    system.debug('response 400--->'+response.getBody());
                    return 'No matching location Found';
                }
            }
        }catch(Exception e){
            system.debug('exception caught-->'+e.getMessage());
        }
        return null;
    }

}
