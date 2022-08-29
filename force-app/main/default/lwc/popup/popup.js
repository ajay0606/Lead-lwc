/*
*       Author:- Ajay Suryawanshi
*
*
*/

import { LightningElement, api, track, wire } from 'lwc';
import saveLog from '@salesforce/apex/LogCall.saveLog';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class Popup extends LightningElement {

    @track openmodel = true;
    
    @api recordId;

    @track subject;
    @track comments;

    handleSubject(event){

        this.subject = event.detail.value;
    }

    handleComments(event){

        this.comments = event.detail.value;
    }


// Add method

    saveRecord(){

        this.openmodel = false;

        saveLog({subject: this.subject, comments: this.comments, leadContact: this.recordId})
        .then(task =>{
            const event = new ShowToastEvent({
            title: 'Success!',
            message: 'Task created!',
            variant: 'success'
        });
        this.dispatchEvent(event);
       
      })
        .catch(error => {
            const event1 = new ShowToastEvent({
            title: 'Error!',
            message: 'Task Not Created!',
            variant: 'error'
    });
    this.dispatchEvent(event1);
    
      });
  
        
    }
 
    
}