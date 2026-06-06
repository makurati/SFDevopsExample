public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> AccountId){
        List<Account> accId=[Select id,Number_Of_Contacts__c,(select id from contacts) from account where id in : AccountId];
        
        for(Account acc: accId){
            List<Contact> lstContact=acc.Contacts;
            acc.Number_Of_Contacts__c= lstContact.size();
            
        }
        update accId;
    }

}