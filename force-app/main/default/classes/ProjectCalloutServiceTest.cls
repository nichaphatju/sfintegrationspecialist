@isTest
public class ProjectCalloutServiceTest{
    
    @TestSetup
    static void makeData(){
        ServiceTokens__c st = new ServiceTokens__c();
        st.Name = 'ProjectServiceToken';
        st.Token__c = 'MOCKUPTOKEN';
        insert st;
    }

    @isTest
    static void testCallSuccess(){
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock());
        Opportunity mockOpp = new Opportunity();
        mockOpp.Name = 'Test Opp';
        mockOpp.Amount = 5000;
        mockOpp.StageName = 'Prospecting';
        mockOpp.Type = 'New Project';
        mockOpp.CloseDate = System.today();
        insert mockOpp;

        Test.startTest();
        mockOpp.StageName = 'Closed Won';
        update mockOpp;
        Test.stopTest();

    }

    @isTest
    static void testCallFailed(){
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure());
        Opportunity mockOpp = new Opportunity();
        mockOpp.Name = 'Test Opp';
        mockOpp.Amount = 5000;
        mockOpp.StageName = 'Prospecting';
        mockOpp.Type = 'New Project';
        mockOpp.CloseDate = System.today();
        insert mockOpp;

        Test.startTest();
        mockOpp.StageName = 'Closed Won';
        update mockOpp;
        Test.stopTest();
        
    }
}
