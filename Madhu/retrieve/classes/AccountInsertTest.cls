@isTest
private class AccountInsertTest {
  @isTest
    static void testme(){
        Account acc=new Account();
        acc.Name='Testing';
        acc.Industry='Banking';
        insert acc;
        Account a1=[select ownership from Account where Id=:acc.id];
        System.assertEquals(a1.ownership,'Public');
    }
}