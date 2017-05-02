trigger accountInsert on Account (before insert,after Insert,before Update ) {
    if(Trigger.isBefore && Trigger.isInsert){
       AccountTriggerHandler.beforeInsert(Trigger.new); 
    }
    if(Trigger.isAfter && Trigger.isInsert){
         AccountTriggerHandler.afterInsert(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.beforeUpdate(Trigger.oldMap,Trigger.NewMap);
    }
}