import { LightningElement, wire, track } from 'lwc';
import leDisplay from '@salesforce/apex/LeadDisplay.leDisplay';
import { NavigationMixin } from 'lightning/navigation';


const actions=[
    {label:'View', name:'view'},
    {label:'Edit', name:'edit'},
    {label:'Delete', name:'delete'},
]

export default class LDisplay extends NavigationMixin(LightningElement) {

    @track data;
    
    @track columns = [
        {label: 'Name', fieldName: 'Name', type: 'text'},
        {label: 'Email', fieldName: 'Email', type: 'email'},
        {label: 'Mobile', fieldName: 'MobilePhone', type: 'phone'},
        {label: 'Company', fieldName: 'Company', type: 'text'},
        {label: 'Status', fieldName: 'Status', type: 'text'},
        {label: 'CreatedDate', fieldName: 'CreatedDate', type: 'date'},
        {
            type:'action',
            typeAttributes:{
                rowActions:actions,
                menuAlignment:'right'
            }
        }
    ]

    @wire(leDisplay) leadRecords({error, data}){
        if(data){
            this.data = data
        }
        else if(error){
            this.data = undefined;
        }
    }
    
    handleRowsAction(event){
        const actionName = event.detail.action.name;
        console.log('event action : ', actionName);
        const row = event.detail.row;
        
        switch(actionName){
            case 'view':
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes:{
                        recordId:row.Id,
                        actionName:'view',
                        
                    }
                });
                break;
            
                case 'edit':
                    this[NavigationMixin.Navigate]({
                        type: 'standard__recordPage',
                        attributes:{
                            recordId:row.Id,
                            actionName:'edit',
                            
                        }
                    });
                    break;
                
                case 'delete':
                    this[NavigationMixin.Navigate]({
                        type: 'standard__recordPage',
                        attributes:{
                            recordId:row.Id,
                            actionName:'delete',
                            
                        }
                    });
                    break;
        }
       
    }

}


