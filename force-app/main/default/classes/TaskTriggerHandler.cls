/*
*       Author:- Ajay Suryawanshi
*
*
*/
public with sharing class TaskTriggerHandler {
    public TaskTriggerHandler() {

    }

    @AuraEnabled
    public static void sendEmailNotificationToLead(List<Task> taskList){
        try {

            List<Messaging.Email> emailList = new List<Messaging.Email>();

            for(Task t : taskList){
                
                if(t.Subject != null && t.Description != null){

                    for(Lead l : [SELECT Id, Title, Name, Email, Phone, Company, Email_Status__c, Date_time__c FROM Lead]){

                        if(t.WhoId == l.Id){

                            if(l.Email != null){

                                for(User u : [SELECT Id, Name, Email FROM User]){

                                    if(t.OwnerId == u.Id){

                                        Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                                        String[] toAddress  = new String[]{u.Email};
                                        emailMsg.setToAddresses(toAddress);
                                        emailMsg.setSenderDisplayName('Ajay Suryawanshi');
                                        emailMsg.setSubject('New Task Created : ' + t.Subject);

                                        String content = 'Hi ' + u.Name + ',<br><br>' +
                                        'New Task, Log a call Created : ' + '<br><br>' +
                                        'Subject : ' + t.Subject + ' <br>' +
                                        'Comments : ' + t.Description + '<br>' +
                                        'For Lead of : ' + '<br>' +
                                        'Name : ' + l.Name + '<br>' +
                                        'Title : ' + l.Title + '<br>' +
                                        'Phone : ' + l.Phone + '<br>' +
                                        'Email : ' + l.Email + '<br>' +
                                        'Company : ' + l.Company + '<br><br>' +  
                                        'Regards,' + '<br>' +
                                        'Salesforce CRM Team';

                                        emailMsg.setHtmlBody(content);

                                        emailList.add(emailMsg);

                                        Database.DMLOptions dlo = new Database.DMLOptions();
                                        dlo.EmailHeader.TriggerAutoResponseEmail = true;
                                        l.Date_time__c = DateTime.now();
                                        l.Email_Status__c = 'Last Email Send With Subject:- "'+ t.Subject +'" At ' + DateTime.now();
                                    
                                        Database.update(l, dlo);
                                        
                                    }

                                }

                            }

                        }
                        
                    }
                }
            }
            Messaging.sendEmail(emailList);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
