codeunit 50132 "WorkFlowEventHandling"
{
    var
        //student application form
        workflowevent: Codeunit "Workflow Event Handling";
        workflowmanagement: Codeunit "Workflow Management";
        StudentApplicationFormSendForApprovalEventDescTxt: Label 'Student form is  send for Approval';
        StudentApplicationFormCancelForApprovalEventDescTxt: Label 'Student form is cancelled';
        StudentApplicationFormReleasedText: Label 'Student Form Is Approved';
        StudentApplicationFormSendForRejectedEventDescTxt: Label 'Student form is  rejected';



    // Student applicatin Form Procedures
    procedure RunWorkFlowOnSendStudentApplicationFormForApprovalCode(): Code[128]

    begin
        exit(UpperCase('RunWorkFlowOnSendStudentApplicationFormForApproval'))

    end;

    procedure RunWorkFlowOnCancelStudentApplicationFormApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnCancelStudentApplicationFormApproval'));
    end;

    procedure RunWorkFlowOnReleaseStudentApplicationFormCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnReleaseStudentApplicationFormApproval'));
    end;

    procedure RunWorkFlowOnRejectedStudentApplicationFormApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnRejectedStudentApplicationFormApproval'));
    end;


    //Adding Events To library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowEventsToLibrary()
    begin
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnSendStudentApplicationFormForApprovalCode, Database::"Student Application Form", StudentApplicationFormSendForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnCancelStudentApplicationFormApprovalCode, Database::"Student Application Form", StudentApplicationFormCancelForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnReleaseStudentApplicationFormCode, Database::"Student Application Form", StudentApplicationFormReleasedText, 0, false);
        workflowevent.AddEventToLibrary(RunWorkFlowOnRejectedStudentApplicationFormApprovalCode, Database::"Student Application Form", StudentApplicationFormSendForRejectedEventDescTxt, 0, false);
    end;

    //Adding Predecessors to library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkFlowOnCancelStudentApplicationFormApprovalCode:
                WorkFlowEvent.AddEventPredecessor(RunWorkFlowOnCancelStudentApplicationFormApprovalCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode);
            WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode)
                end;

        end;
    end;

    //Events Subscribers

    [EventSubscriber(ObjectType::Codeunit::Codeunit, 50131, 'OnSendStudentApplicationFormForApproval', '', true, true)]
    local procedure RunWorkFlowOnSendStudentApplicationFormForApproval(var Applicant: Record "Student Application Form")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnSendStudentApplicationFormForApprovalCode, Applicant);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgt", 'OnCancelStudentApplicationFormForApproval', '', true, true)]
    local procedure RunWorkFlowOnCancelStudentApplicationFormForApproval(var Applicant: Record "Student Application Form")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnCancelStudentApplicationFormApprovalCode, Applicant);
    end;

}

