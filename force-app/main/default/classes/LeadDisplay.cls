public with sharing class LeadDisplay {
    public LeadDisplay() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Lead> leDisplay(){
        try {
            return[SELECT Name, Email, MobilePhone,
            Company, Status, CreatedDate
             FROM Lead ORDER BY CreatedDate DESC LIMIT 10  WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
