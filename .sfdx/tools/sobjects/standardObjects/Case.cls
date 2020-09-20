// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Case {
    global Id Id;
    global Boolean IsDeleted;
    global Case MasterRecord;
    global Id MasterRecordId;
    global String CaseNumber;
    global Contact Contact;
    global Id ContactId;
    global Account Account;
    global Id AccountId;
    global Asset Asset;
    global Id AssetId;
    global Case Parent;
    global Id ParentId;
    global String SuppliedName;
    global String SuppliedEmail;
    global String SuppliedPhone;
    global String SuppliedCompany;
    global String Type;
    global RecordType RecordType;
    global Id RecordTypeId;
    global String Status;
    global String Reason;
    global String Origin;
    global String Subject;
    global String Priority;
    global String Description;
    global Boolean IsClosed;
    global Datetime ClosedDate;
    global Boolean IsEscalated;
    global SObject Owner;
    global Id OwnerId;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global String ContactPhone;
    global String ContactMobile;
    global String ContactEmail;
    global String ContactFax;
    global String Comments;
    global Datetime LastViewedDate;
    global Datetime LastReferencedDate;
    global String TRACEY__EngineeringReqNumber__c;
    global String TRACEY__SLAViolation__c;
    global String TRACEY__Product__c;
    global String TRACEY__PotentialLiability__c;
    /* Date by when this care gap should be closed.
    */
    global Date HealthCloudGA__DueDate__c;
    /* Potential savings by closing this care gap.
    */
    global Decimal HealthCloudGA__FinancialValue__c;
    /* Rank by which this care gap is sorted.
    */
    global Double HealthCloudGA__SortOrder__c;
    /* ID of the source agency's measure for this care gap.
    */
    global String HealthCloudGA__SourceAgencyMeasureID__c;
    /* Version of the source agency's ID measure for this care gap.
    */
    global String HealthCloudGA__SourceAgencyMeasureVersion__c;
    /* Agency that identified the care gap.
    */
    global String HealthCloudGA__SourceAgency__c;
    /* Record ID in the source system.
    */
    global String HealthCloudGA__SourceSystemID__c;
    /* When last updated.
    */
    global Datetime HealthCloudGA__SourceSystemModified__c;
    /* Name of the system where this care gap was identified.
    */
    global String HealthCloudGA__SourceSystem__c;
    global List<Account> HealthCloudGA__PatientAccounts__r;
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<Attachment> Attachments;
    global List<CareBarrier> CareBarriers;
    global List<CareDiagnosis> CareDiagnoses;
    global List<CareRequest> CareRequests;
    global List<CareRequestExtension> CaseCareRequestExtensions;
    global List<CareRequestItem> CareRequestItems;
    global List<Case> Cases;
    global List<CaseComment> CaseComments;
    global List<CaseContactRole> CaseContactRoles;
    global List<CaseFeed> Feeds;
    global List<CaseHistory> Histories;
    global List<CaseShare> Shares;
    global List<CaseSolution> CaseSolutions;
    global List<CaseTeamMember> TeamMembers;
    global List<CaseTeamTemplateRecord> TeamTemplateRecords;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContactRequest> ContactRequests;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<EmailMessage> EmailMessages;
    global List<EmailMessage> Emails;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Event> Events;
    global List<HealthCloudGA__CarePlanGoal__c> HealthCloudGA__CarePlanGoals__r;
    global List<HealthCloudGA__CarePlanProblem__c> HealthCloudGA__CarePlanProblems__r;
    global List<LiveChatTranscript> LiveChatTranscripts;
    global List<MessagingSession> MessagingSessions;
    global List<NetworkActivityAudit> ParentEntities;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<OpenActivity> OpenActivities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<ProductRequest> ProductRequests;
    global List<ProductRequestLineItem> ProductRequestLineItems;
    global List<RecordAction> RecordActions;
    global List<RecordActionHistory> RecordActionHistories;
    global List<SOSSession> SOSSessions;
    global List<SurveySubject> SurveySubjectEntities;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<AgentWork> WorkItem;
    global List<CareRequestDrug> CareRequestCase;
    global List<CaseChangeEvent> Parent;
    global List<ContentDistribution> RelatedRecord;
    global List<ContentVersion> FirstPublishLocation;
    global List<EventChangeEvent> What;
    global List<EventRelationChangeEvent> Relation;
    global List<FeedComment> Parent;
    global List<FlowRecordRelation> RelatedRecord;
    global List<LiveChatTranscriptChangeEvent> Case;
    global List<PendingServiceRouting> WorkItem;
    global List<TaskChangeEvent> What;

    global Case () 
    {
    }
}