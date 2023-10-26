public with sharing class RegistrationFormController {

    public static Id recordId {get;set;}
    public static RecordInfo recInfo {get;set;}

    public class RecordInfo{
        public Id id {get; set;}
        public String name {get; set;}
    }

    public RecordInfo getRecordInfo(){
        RecordInfo info = new RecordInfo();
        if(recordId != null){
            /** Suppose consent needs to be kept in account */
            Account acc = [SELECT Id,Name FROM Account WHERE Id = :recordId];
            info.id = acc.id;
            info.name = acc.Name;
        }
        recInfo = info;
        return info;
    }

    public RegistrationFormController() {
        System.debug('RegistrationFormController');
        // name = '';
    }

    public static void submitConsent(){
        System.debug('Submit consent!');
        // Account acc = new Account(Id=recInfo.id,Consent__c=true);
        // update acc;
    }
}