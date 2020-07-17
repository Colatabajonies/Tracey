global with sharing class Tracey_EncounterAddAccountParticipants 
{
    @InvocableMethod(label='Tracey - Add Encounter Participants by Email')
    global static List<String> addEParticipants(List<addEParticipantsRequest> requests) 
    {
        List<String> results = new List<String>();
        string result = '';
        
        for (addEParticipantsRequest request : requests)
        {
            try
            {
                if (request.Encounter != null && String.isNotBlank(request.emailString))
                {
                    List<String> emails = new List<String>(request.emailString.split(','));
                    List<Account> accts = new List<Account>([SELECT ID, Name, FirstName, LastName, PersonEmail, Phone, PersonTitle, PersonContactId FROM Account WHERE PersonEmail  IN: emails]);
                    
                    List<ContactEncounterParticipant> oldCEPs = new List<ContactEncounterParticipant>([SELECT ID, ContactID, ContactEncounterId FROM ContactEncounterParticipant WHERE ContactEncounterId =: request.Encounter.Id]);
                    List<ContactEncounterParticipant> newCEPs = new List<ContactEncounterParticipant>();
                    for (Account a : accts)
                    {
                        Boolean skip = false;
                        for(ContactEncounterParticipant op : oldCEPs)
                        {
                            //If the contact encounter participant is already on the encounter, skip it
                            if (op.contactID == a.PersonContactId)
                            {
                                skip = true;
                                break;
                            }
                        }
                        if (!skip)
                        {
                            ContactEncounterParticipant newCEP = new ContactEncounterParticipant();
                            newCEP.ContactEncounterId = request.Encounter.Id;
                            newCEP.ContactId = a.PersonContactId;
                            newCEP.Tracey_Bot_Notify__c = true;
                            //newCEP.Age = Integer.valueOf(a.HealthCloudGA__Age__pc);
                            newCEPs.add(newCEP);
                        }
                    }
                    
                    if (newCEPs.size() > 0 && Schema.sObjectType.ContactEncounterParticipant.isCreateable())
                    {
                        INSERT newCEPs;
                    }
                }
            }
            catch(Exception ex)
            {
                result = 'Error: ' + ex.getMessage();
                results.add(result);
            }
        }
        return results;
    }
    
    global class addEParticipantsRequest
    {
        @InvocableVariable(required=true)
        global ContactEncounter Encounter;
        @InvocableVariable(required=true)
        global String EmailString;
    }
}