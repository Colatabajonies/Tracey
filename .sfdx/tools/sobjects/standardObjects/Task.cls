// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Task {
    global Id Id;
    global RecordType RecordType;
    global Id RecordTypeId;
    global SObject Who;
    global Id WhoId;
    global SObject What;
    global Id WhatId;
    global String Subject;
    global Date ActivityDate;
    global String Status;
    global String Priority;
    global Boolean IsHighPriority;
    global User Owner;
    global Id OwnerId;
    global String Description;
    global String Type;
    global Boolean IsDeleted;
    global Account Account;
    global Id AccountId;
    global Boolean IsClosed;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global Boolean IsArchived;
    global Boolean IsVisibleInSelfService;
    global Integer CallDurationInSeconds;
    global String CallType;
    global String CallDisposition;
    global String CallObject;
    global Datetime ReminderDateTime;
    global Boolean IsReminderSet;
    global Task RecurrenceActivity;
    global Id RecurrenceActivityId;
    global Boolean IsRecurrence;
    global Date RecurrenceStartDateOnly;
    global Date RecurrenceEndDateOnly;
    global String RecurrenceTimeZoneSidKey;
    global String RecurrenceType;
    global Integer RecurrenceInterval;
    global Integer RecurrenceDayOfWeekMask;
    global Integer RecurrenceDayOfMonth;
    global String RecurrenceInstance;
    global String RecurrenceMonthOfYear;
    global String RecurrenceRegeneratedType;
    global String TaskSubtype;
    global Datetime CompletedDateTime;
    /* The action category.  To display the task in the Workplace Command Center Operations Feed, specify a value for this field.
    */
    global String wkcc__ActionCategory__c;
    /* An absolute or relative URL to a page or record. The URL includes any required parameters. Relative URLs are relative to the Salesforce instance.
    */
    global String wkcc__ActionUrl__c;
    /* A reference to the Location that this Task is related to.
    */
    global Location wkcc__Location__r;
    /* A reference to the Location that this Task is related to.
    */
    global Id wkcc__Location__c;
    /* Goal this task is meant to address
    */
    global HealthCloudGA__CarePlanGoal__c HealthCloudGA__CarePlanGoal__r;
    /* Goal this task is meant to address
    */
    global Id HealthCloudGA__CarePlanGoal__c;
    /* Problem this task is mean to address
    */
    global HealthCloudGA__CarePlanProblem__c HealthCloudGA__CarePlanProblem__r;
    /* Problem this task is mean to address
    */
    global Id HealthCloudGA__CarePlanProblem__c;
    global HealthCloudGA__CarePlanTemplate__c HealthCloudGA__CarePlanTemplate__r;
    global Id HealthCloudGA__CarePlanTemplate__c;
    global String HealthCloudGA__Category__c;
    global Double HealthCloudGA__SortOrder__c;
    global String HealthCloudGA__TaskType__c;
    /* The API name of the automation to start. This value is required for the Flow action type.
    */
    global String wkcc__ActionApiName__c;
    /* A JSON formatted string of variables. These are used for the Flow action type to specify input variables.
    */
    global String wkcc__ActionInputVariables__c;
    /* The type of action being performed by this task if it has an automated action.
    */
    global String wkcc__ActionType__c;
    global Double HealthCloudGA__Age__c;
    global String HealthCloudGA__Conditions_Status__c;
    global String HealthCloudGA__Gender__c;
    global String HealthCloudGA__Monitored_at_Home__c;
    global String HealthCloudGA__Testing_Status__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<Attachment> Attachments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<NetworkActivityAudit> ParentEntities;
    global List<NetworkUserHistoryRecent> NetworkUserHistoryRecentToRecord;
    global List<SurveySubject> SurveySubjectEntities;
    global List<Task> RecurringTasks;
    global List<TaskFeed> Feeds;
    global List<TopicAssignment> TopicAssignments;
    global List<ContentVersion> FirstPublishLocation;
    global List<EmailMessage> Activity;
    global List<EmailStatus> Task;
    global List<FeedComment> Parent;
    global List<FlowRecordRelation> RelatedRecord;
    global List<TaskChangeEvent> RecurrenceActivity;

    global Task () 
    {
    }
}