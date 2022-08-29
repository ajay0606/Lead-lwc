/*
*       Author:- Ajay Suryawanshi
*
*
*/
public with sharing class LeadDisplay {
    public LeadDisplay() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Lead> leDisplay(){
        try {
            return[SELECT Name, Email, MobilePhone,
            Company, Status, CreatedDate
             FROM Lead  WITH SECURITY_ENFORCED ORDER BY CreatedDate DESC LIMIT 10 ];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}
