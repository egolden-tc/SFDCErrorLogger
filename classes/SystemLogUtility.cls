global class SystemLogUtility {

    global static void log(String message) {
        generateSystemLog(message,System.Label.Log_Type,'',true,false);
    } 
    
    global static void log(Exception ex) {
        generateSystemLog(ex,System.Label.Log_Type,'',true,false);
    }     
    
    global static void warn(String message) {
        generateSystemLog(message,System.Label.Warn_Type,'',true,false);        
    }

    global static void warn(Exception ex) {
        generateSystemLog(ex,System.Label.Warn_Type,'',true,false);          
    }
    
    global static void error(String message) {
        generateSystemLog(message,System.Label.Error_Type,'',true,false);         
    }

    global static void error(Exception ex) {
        generateSystemLog(ex,System.Label.Error_Type,'',true,false);         
    }  
    
    private static System_Log__c generateSystemLog(String message, String logType, String priority,Boolean isInsert,Boolean debug) {
        if(debug) {
            System.debug(message);
        }
        
        System_Log__c slog = new System_Log__c(Log_Detail__c = message,Type__c = logType, Log_Priority__c = priority);
        
        if(isInsert) {
            insert(slog);
        }
        
        return slog;
    }      
    
    private static System_Log__c generateSystemLog(Exception ex, String logType, String priority,Boolean isInsert,Boolean debug) {
        if(debug) {
            System.debug(ex);
        }
        
        System_Log__c slog = new System_Log__c(Log_Detail__c = ex.getCause() + '\n\n' + ex.getLineNumber() +'\n\n' + ex.getMessage() + '\n\n' + ex.getStackTraceString() + '\n\n' + ex.getTypeName()   ,Type__c = logType, Log_Priority__c = priority);
        
        if(isInsert) {
            insert(slog);
        }
        
        return slog;        
    }          
    
}