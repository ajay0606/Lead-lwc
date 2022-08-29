/*
*       Author:- Ajay Suryawanshi
*
*
*/
trigger TaskTrigger on Task (before insert, before update, before delete, after insert, after update, after delete,after undelete) {

    if(Trigger.isInsert && Trigger.isAfter){

        TaskTriggerHandler.sendEmailNotificationToLead(Trigger.new);
    }
}