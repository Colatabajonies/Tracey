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
                ContactEncounter myEncounter = request.Encounter;
                String emailString = request.emailString;
                emailString = emailString.remove(' ');
                emailString = emailString.removeStart(',');
                emailString = emailString.removeEnd(',');
                emailString = emailString.toLowerCase();
                
                if (myEncounter != null && String.isNotBlank(emailString))
                {
                    List<String> emails = new List<String>(emailString.split(','));
                    List<Account> accts = new List<Account>([SELECT ID, Name, FirstName, LastName, PersonEmail, Phone, PersonTitle, PersonContactId FROM Account WHERE PersonEmail  IN: emails]);
                    
                    List<ContactEncounterParticipant> oldCEPs = new List<ContactEncounterParticipant>([SELECT ID, ContactID, ContactEncounterId FROM ContactEncounterParticipant WHERE ContactEncounterId =: myEncounter.Id]);
                    List<ContactEncounterParticipant> newCEPs = new List<ContactEncounterParticipant>();
                    
                    for (Account a : accts)
                    {
                        Boolean skip = false;
                        for(ContactEncounterParticipant op : oldCEPs)
                        {
                            //If the contact encounter participant is already on the encounter, skip it
                            if (op.contactID == a.PersonContactId) skip = true;
                        }
                        if (!skip)
                        {
                            ContactEncounterParticipant newCEP = new ContactEncounterParticipant(ContactEncounterId=myEncounter.Id, ContactId=a.PersonContactId,Tracey_Bot_Notify__c=true);
                            newCEPs.add(newCEP);
                        }
                    }
                    
                    if (newCEPs.size() == 0)
                    {
                        system.debug('No new Encounter Participants to add');
                    }
                    if (newCEPs.size() > 0 && Schema.sObjectType.ContactEncounterParticipant.isCreateable())
                    {
                        INSERT newCEPs;
                    }
                }
            }
            catch(Exception ex)
            {
                results.add('Error: ' + ex.getMessage());
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