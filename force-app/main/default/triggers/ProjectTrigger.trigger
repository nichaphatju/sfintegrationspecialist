trigger ProjectTrigger on Project__c (after update) {
    //Call the Billing Service callout logic here
    for(Project__c projNew: Trigger.new){
        Map<Id, Project__c> oldProject = (Map<Id, Project__c>) Trigger.oldMap;
        BillingCalloutService.callBillingService(projNew, oldProject.get(projNew.Id));
    }
}