@isTest
private with sharing class Tracey_Tests 
{
    static testMethod void validateEncounterQuery() 
    {
        //Create a Contact Encounter
        ContactEncounter newE = new ContactEncounter();
        newE.Name = 'test e';
        newE.EncounterDuration = 60;
        newE.EstimatedParticipantCount = 3;
        newE.StartTime = DateTime.now().addDays(-3);
        INSERT newE;
        
        //Add list of IDs
        List<String> eIds = new List<String>();
        eIds.add(newE.Id);
        
        List<List<ContactEncounter>> theResults = Tracey_EncounterQuery.getEncounters(new List<List<String>>{eIds});
        System.assert(theResults.size() == 1);
        System.assert(theResults[0].size() == 1);
    }
    
    static testMethod void validateAddParticipants() 
    {
        //Create a Contact Encounter
        ContactEncounter newE = new ContactEncounter();
        newE.Name = 'test e';
        newE.EncounterDuration = 60;
        newE.EstimatedParticipantCount = 3;
        newE.StartTime = DateTime.now().addDays(-3);
        INSERT newE;
        
        //Add Employees
        Account a = new Account();
        a.FirstName = 'Chris';
        a.LastName = 'Smith';
        a.PersonEmail = 'csmith@example.com';
        a.PersonTitle = 'CEO';
        INSERT a;
        Account b = new Account();
        b.FirstName = 'Sally';
        b.LastName = 'Smith';
        b.PersonEmail = 'ssmith@example.com';
        b.PersonTitle = 'CIO';
        INSERT b;
        
        b = [SELECT ID, FirstName, LastName, PersonEmail, PersonTitle, PersonContactId FROM Account WHERE ID =: b.Id];
        //Add Sally to Encounter
        ContactEncounterParticipant newCEP = new ContactEncounterParticipant();
        newCEP.ContactEncounterId = newE.Id;
        newCEP.ContactId = b.PersonContactId;
        INSERT newCEP;
        
        Tracey_EncounterAddAccountParticipants.addEParticipantsRequest request = new Tracey_EncounterAddAccountParticipants.addEParticipantsRequest();
        request.EmailString = 'csmith@example.com,ssmith@example.com';
        request.Encounter = newE;
        
        List<String> results = Tracey_EncounterAddAccountParticipants.addEParticipants(new List<Tracey_EncounterAddAccountParticipants.addEParticipantsRequest>{request});
        System.assert(results.size() == 0);
    }
    
    static testMethod void validateGetEncounterParticipants() 
    {
        //Create a Contact Encounter
        ContactEncounter newE = new ContactEncounter();
        newE.Name = 'test e';
        newE.EncounterDuration = 60;
        newE.EstimatedParticipantCount = 3;
        newE.StartTime = DateTime.now().addDays(-3);
        INSERT newE;
        
        //Add Employees
        Account a = new Account();
        a.FirstName = 'Chris';
        a.LastName = 'Smith';
        a.PersonEmail = 'csmith@example.com';
        a.PersonTitle = 'CEO';
        INSERT a;
        Account b = new Account();
        b.FirstName = 'Sally';
        b.LastName = 'Smith';
        b.PersonEmail = 'ssmith@example.com';
        b.PersonTitle = 'CIO';
        INSERT b;
        Lead l = new Lead();
        l.FirstName = 'Victoria';
        l.LastName = 'Smith';
        l.Email = 'vsmith@example.com';
        l.Company = 'ACME';
        INSERT l;
        
        b = [SELECT ID, FirstName, LastName, PersonEmail, PersonTitle, PersonContactId FROM Account WHERE ID =: b.Id];
        //Add Sally to Encounter
        ContactEncounterParticipant newCEP = new ContactEncounterParticipant();
        newCEP.ContactEncounterId = newE.Id;
        newCEP.ContactId = b.PersonContactId;
        INSERT newCEP;
        
        ContactEncounterParticipant newCEP2 = new ContactEncounterParticipant();
        newCEP2.ContactEncounterId = newE.Id;
        newCEP2.LeadId = l.Id;
        INSERT newCEP2;
        
        List<Tracey_GetEncounterParticipants.getEParticipantsResult> results = Tracey_GetEncounterParticipants.getEParticipants(new List<ID>{newE.Id});
        System.assert(results.size() == 1);
        System.assert(results[0].Accounts.size() == 1);
        System.assert(results[0].Leads.size() == 1);
    }
}