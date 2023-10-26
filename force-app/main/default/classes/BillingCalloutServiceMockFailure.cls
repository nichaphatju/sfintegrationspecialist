@isTest
global class BillingCalloutServiceMockFailure implements WebServiceMock {
   global void doInvoke(Object stub,
                        Object request,
                        Map<String, Object> response,
                        String endpoint,
                        String soapAction,
                        String requestName,
                        String responseNS,
                        String responseName,
                        String responseType) {
        BillingServiceProxy.billProjectResponse_element bspResponse = new BillingServiceProxy.billProjectResponse_element();
        bspResponse.status = 'UNAUTHORIZED';
        response.put('response_x', bspResponse); 
   }
}