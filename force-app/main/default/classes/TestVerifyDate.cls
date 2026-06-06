@isTest
public class TestVerifyDate {

    @isTest static void TestCheckDates(){
        Date d= VerifyDate.CheckDates(system.today()+5, system.today()+10);
        system.assertEquals(system.today()+10, d, 'Exists');
    }
    
     @isTest static void TestCheckDatesNotinRange(){
        Date d= VerifyDate.CheckDates(system.today()+5, system.today());
        system.assertEquals(system.today()+29, d, 'Not Exists');
    }
}