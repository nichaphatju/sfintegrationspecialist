public class QueueablePMSCall implements Queueable, Database.AllowsCallouts {

    public Opportunity opp = new Opportunity();

    public QueueablePMSCall(Opportunity opp){
        this.opp = opp;
    }

    public void execute(QueueableContext context) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:ProjectService');
        req.setHeader('token', ServiceTokens__c.getValues('ProjectServiceToken').Token__c);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        OppParam oppParam = new OppParam();
        oppParam.opportunityId = opp.Id;
        oppParam.opportunityName = opp.Name;
        oppParam.accountName = opp.Account.Name;
        oppParam.closeDate = String.valueOf(opp.CloseDate);
        oppParam.amount = opp.Amount;
        System.debug(JSON.serialize(oppParam));
        req.setBody(JSON.serialize(oppParam));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res);
        if(res.getStatusCode() == 201){
            this.opp.StageName = 'Submitted Project';
        }else{
            this.opp.StageName = 'Resubmit Project';
        }
        update this.opp;
    }

    public Class OppParam { 
        public String opportunityId;
        public String opportunityName;
        public String accountName;
        public String closeDate;
        public Decimal amount;
    }
}