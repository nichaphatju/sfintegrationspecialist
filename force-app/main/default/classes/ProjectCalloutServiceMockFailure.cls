@isTest
global class ProjectCalloutServiceMockFailure implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(500);
        res.setStatus('Failure');
        return res;
    }
}
