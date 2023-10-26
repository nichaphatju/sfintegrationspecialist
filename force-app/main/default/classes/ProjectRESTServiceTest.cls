@isTest
public class ProjectRESTServiceTest {
    
    @isTest static void testRestServicePass(){
        Opportunity mockOpp = new Opportunity();
        mockOpp.Name = 'Test Opp';
        mockOpp.Amount = 5000;
        mockOpp.StageName = 'Prospecting';
        mockOpp.Type = 'New Project';
        mockOpp.CloseDate = System.today();
        insert mockOpp;

        ProjectRESTService reqst = new ProjectRESTService();
        Test.startTest();

        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        String jsonMsg = '{\"ProjectRef\":\"PROJ REF\", \"ProjectName\":\"PROJ NAME\", \"OpportunityId\" : '+ mockOpp.Id +',\"StartDate\": '+ System.today() +',\"EndDate\"'+ System.today() + ',\"Amount\":'+ mockOpp.Amount +',\"Status\":\"Billed\" }';
        req.requestURI = '/services/apexrest/project';  //Request URL
        req.httpMethod = 'POST';//HTTP Request Type
        req.requestBody = Blob.valueOf(jsonMsg);
        RestContext.request = req;
        RestContext.response= res;
        String result = ProjectRESTService.postProjectData('PROJ REF', 'PROJ NAME', String.valueOf(mockOpp.Id), System.today(), System.today(), Double.valueOf(mockOpp.Amount), 'Billed');
        Test.stopTest();
    }

    @isTest static void testRestServiceFailed(){
        Opportunity mockOpp = new Opportunity();
        mockOpp.Name = 'Test Opp';
        mockOpp.Amount = 5000;
        mockOpp.StageName = 'Prospecting';
        mockOpp.Type = 'New Project';
        mockOpp.CloseDate = System.today();
        insert mockOpp;

        ProjectRESTService reqst = new ProjectRESTService();
        Test.startTest();

        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        String jsonMsg = '{\"ProjectRef\":\"PROJ REF\", \"ProjectName\":\"PROJ NAME\", \"OpportunityId\" : \"ABC\",\"StartDate\": '+ System.today() +',\"EndDate\"'+ System.today() + ',\"Amount\":'+ mockOpp.Amount +',\"Status\":\"Billed\" }';
        req.requestURI = '/services/apexrest/project';  //Request URL
        req.httpMethod = 'POST';//HTTP Request Type
        req.requestBody = Blob.valueOf(jsonMsg);
        RestContext.request = req;
        RestContext.response= res;
        String result = ProjectRESTService.postProjectData('PROJ REF', 'PROJ NAME', 'ABC', System.today(), System.today(), Double.valueOf(mockOpp.Amount), 'Billed');
        Test.stopTest();
    }
}
