global with sharing class Tracey_GetEncounterParticipants 
{
    @InvocableMethod(label='Tracey - Get Encounter Participants by Encounter')
    global static List<getEParticipantsResult> getEParticipants(List<Id> requests) 
    {
        List<getEParticipantsResult> results = new List<getEParticipantsResult>();
        getEParticipantsResult result = new getEParticipantsResult();
        result.Accounts = new List<Account>();
        result.Leads = new List<Lead>();
        
        for (Id request : requests)
        {
            try
            {
                //First Get Contact Encounter Participants
                List<ContactEncounterParticipant> CEPs = new List<ContactEncounterParticipant>([SELECT ID, ContactID, LeadId FROM ContactEncounterParticipant WHERE ContactEncounterId =: request]);
                List<ID> contactIDs = new List<ID>();
                List<ID> leadIDs = new List<ID>();
                for (ContactEncounterParticipant cep : ceps)
                {
                    if (cep.ContactID != null)
                    {
                        contactIDs.add(cep.ContactID);
                    }
                    else if (cep.LeadID != null)
                    {
                        leadIds.add(cep.LeadId);
                    }
                }
                result.Accounts = new List<Account>([SELECT  ID, FirstName, LastName, PersonEmail, Phone, PersonTitle FROM Account WHERE PersonContactId IN: contactIDs]);
                result.Leads = new List<Lead>([SELECT ID, FirstName, LastName, Email, Company FROM Lead WHERE ID IN: leadIDS]);
                break;
            }
            catch(Exception ex)
            {
            }
        }
        
        results.add(result);
        return results;
        
    }
    
    global with sharing class getEParticipantsResult
    {
        @InvocableVariable(required=false)
        global List<Account> Accounts;
        @InvocableVariable(required=false)
        global List<Lead> Leads;
    }
}