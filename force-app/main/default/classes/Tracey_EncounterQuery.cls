global with sharing class Tracey_EncounterQuery 
{
    @InvocableMethod(label='Tracey - Get Contact Encounters')
    global static List<List<ContactEncounter>> getEncounters(List<List<String>> requests) 
    {
        List<List<ContactEncounter>> results = new List<List<ContactEncounter>>();
        List<ContactEncounter> result = new List<ContactEncounter>();
        
        for (List<String> request : requests)
        {
            try
            {
                if (request.size() > 0)
                {
                    result = new List<ContactEncounter>([SELECT Id, Name, StartTime, Description, ActualParticipantCount, EncounterDuration, LocationId, Tracey_Location_Name__c, EstimatedParticipantCount, Tracey_StartTime_String__c  FROM ContactEncounter WHERE ID In: request ORDER BY StartTime DESC]);
                    results.add(result);
                }
            }
            catch(Exception ex)
            {
            }
        }
        return results;
    }
}