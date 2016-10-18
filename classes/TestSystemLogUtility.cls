@isTest
private class TestSystemLogUtility {
    private static testMethod void testSystemLogUtility() {
        try {
            insert new Account();
        } catch(Exception e) {
	        SystemLogUtility.log('test');            
            SystemLogUtility.log(e);
            SystemLogUtility.warn('test');
            SystemLogUtility.warn(e);
            SystemLogUtility.error('test');
            SystemLogUtility.error(e);
            System.assertNotEquals(new List<System_Log__c>(), [SELECT Id FROM System_Log__c]);
                
        }

    }
}