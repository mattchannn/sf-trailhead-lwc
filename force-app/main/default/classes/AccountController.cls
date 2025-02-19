public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    public static Account saveAccount(Map<String,Object> inputMap, Map<String,Object> outputMap, Map<String, Object> options) {
        system.debug('>> saveAccount starts');
        Account acct = new Account();

        String accountName = (String) inputMap.get('accountName');
        String website = (String) inputMap.get('website');
        acct.Name = accountName;
        acct.website = website;

        system.debug('>> Before saving account detail');
        system.debug('>> accountName = ' + accountName + ', website = ' + website);
        system.debug('>> options: ' + options);

        if (acct == null) {
            return acct;
        }
        
        system.debug('>> saveAccount ends');
        return acct;
        // insert acct;
    }
}