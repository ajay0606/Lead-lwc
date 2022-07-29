import { LightningElement, api, track } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Lead';


export default class Popup extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;

    @track openmodel = true;
    
    
}