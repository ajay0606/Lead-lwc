/*
*       Author:- Ajay Suryawanshi
*
*
*/
public with sharing class LogCall {
    public LogCall() {

    }
   

       @AuraEnabled
       public static void saveLog(String subject, String comments, Id leadContact){
        try {

            Task task = new Task();
            task.Subject = subject;
            task.Description = comments;
            task.WhoId = leadContact;
            task.OwnerId = UserInfo.getUserId();   

            if(task.Subject != null && task.Description != null){

                insert task;   
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
       }

       
}
