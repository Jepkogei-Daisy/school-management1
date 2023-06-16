codeunit 50132 "WorkFlowEventHandling"
{
    var
        //student application form
        workflowevent: Codeunit "Workflow Event Handling";
        workflowmanagement: Codeunit "Workflow Management";
        //student application form
        StudentApplicationFormSendForApprovalEventDescTxt: Label 'Student form is  send for Approval';
        StudentApplicationFormCancelForApprovalEventDescTxt: Label 'Student form is cancelled';
        StudentApplicationFormReleasedText: Label 'Student Form Is Approved';
        StudentApplicationFormSendForRejectedEventDescTxt: Label 'Student form is  rejected';
        //student invoice
        StudentInvoiceSendForApprovalEventDescTxt: Label 'Student Invoice is  send for Approval';
        StudentInvoiceCancelForApprovalEventDescTxt: Label 'Student invoice is cancelled';
        StudentInvoiceReleasedText: Label 'Student invoice Is Approved';
        StudentInvoiceSendForRejectedEventDescTxt: Label 'Student invoice is  rejected';



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

    //Invoice procedure
    procedure RunWorkFlowOnSendStudentInvoiceForApprovalCode(): Code[128]

    begin
        exit(UpperCase('RunWorkFlowOnSendStudentInvoiceForApproval'))

    end;

    procedure RunWorkFlowOnCancelStudentInvoiceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnCancelStudentInvoiceApproval'));
    end;

    procedure RunWorkFlowOnReleaseStudentInvoiceCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnReleaseStudentInvoiceApproval'));
    end;

    procedure RunWorkFlowOnRejectedStudentInvoiceApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkFlowOnRejectedStudentInvoiceApproval'));
    end;


    //Adding Events To library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowEventsToLibrary()
    begin
        //Student application form
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnSendStudentApplicationFormForApprovalCode, Database::"Student Application Form", StudentApplicationFormSendForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnCancelStudentApplicationFormApprovalCode, Database::"Student Application Form", StudentApplicationFormCancelForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnReleaseStudentApplicationFormCode, Database::"Student Application Form", StudentApplicationFormReleasedText, 0, false);
        workflowevent.AddEventToLibrary(RunWorkFlowOnRejectedStudentApplicationFormApprovalCode, Database::"Student Application Form", StudentApplicationFormSendForRejectedEventDescTxt, 0, false);

        // Student Invoice
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnSendStudentInvoiceForApprovalCode, Database::"Student Invoice", StudentInvoiceSendForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnCancelStudentInvoiceApprovalCode, Database::"Student Invoice", StudentInvoiceCancelForApprovalEventDescTxt, 0, false);
        WorkFlowEvent.AddEventToLibrary(RunWorkFlowOnReleaseStudentInvoiceCode, Database::"Student Invoice", StudentInvoiceReleasedText, 0, false);
        workflowevent.AddEventToLibrary(RunWorkFlowOnRejectedStudentInvoiceApprovalCode, Database::"Student Invoice", StudentInvoiceSendForRejectedEventDescTxt, 0, false);

    end;


    //Adding Predecessors to library

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Event Handling", 'OnAddWorkFlowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        //student application form
        case EventFunctionName of
            RunWorkFlowOnCancelStudentApplicationFormApprovalCode:
                WorkFlowEvent.AddEventPredecessor(RunWorkFlowOnCancelStudentApplicationFormApprovalCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode);

            RunWorkFlowOnRejectedStudentApplicationFormApprovalCode:
                workflowevent.AddEventPredecessor(RunWorkFlowOnRejectedStudentApplicationFormApprovalCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode);

            WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode)
                end;
            WorkFlowEvent.RunWorkflowOnDelegateApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnDelegateApprovalRequestCode, RunWorkFlowOnSendStudentApplicationFormForApprovalCode)
                end;

        end;
        //student invoice
        case EventFunctionName of
            RunWorkFlowOnCancelStudentInvoiceApprovalCode:
                WorkFlowEvent.AddEventPredecessor(RunWorkFlowOnCancelStudentInvoiceApprovalCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode);

            RunWorkFlowOnRejectedStudentInvoiceApprovalCode:
                workflowevent.AddEventPredecessor(RunWorkFlowOnRejectedStudentInvoiceApprovalCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode);

            WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnApproveApprovalRequestCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode)
                end;
            WorkFlowEvent.RunWorkflowOnDelegateApprovalRequestCode:
                begin
                    WorkFlowEvent.AddEventPredecessor(WorkFlowEvent.RunWorkFlowOnDelegateApprovalRequestCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode)
                end;

        end;
    end;

    //Events Subscribers
    //student application form
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

    //student invoice
    [EventSubscriber(ObjectType::Codeunit::Codeunit, 50131, 'OnSendStudentInvoiceForApproval', '', true, true)]
    local procedure RunWorkFlowOnSendStudentInvoiceForApproval(var Applicant1: Record "Student Invoice")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnSendStudentInvoiceForApprovalCode, Applicant1);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgt", 'OnCancelStudentInvoiceForApproval', '', true, true)]
    local procedure RunWorkFlowOnCancelStudentInvoiceForApproval(var Applicant1: Record "Student Invoice")
    begin
        WorkFlowManagement.HandleEvent(RunWorkFlowOnCancelStudentInvoiceApprovalCode, Applicant1);
    end;

}

