codeunit 50131 "Approval Mgt"
{

    [IntegrationEvent(false, false)]
    procedure OnSendStudentApplicationFormForApproval(Var Applicant: Record "Student Application Form")
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelStudentApplicationFormForApproval(var Applicant: Record "Student Application Form")
    begin

    end;
    //  [IntegrationEvent(false, false)]
    // procedure OnReleaseStudentApplicationForm(Var Applicant: Record "Student Application Form")
    // begin

    // end;


    //check weather student workflows is enabled
    procedure CheckStudentApplicationFormApprovalsWorkFlowEnable(var Applicant: Record "Student Application Form"): Boolean
    begin
        IF NOT IsStudentApplicationFormApprovalsWorkFlowEnable(Applicant) then
            Error(NoWorkFlowEnabledErr);
        exit(true);
    end;

    procedure IsStudentApplicationFormApprovalsWorkFlowEnable(var Applicant: Record "Student Application Form"): Boolean
    begin
        IF Applicant."Approval Status" <> Applicant."Approval Status"::Open then
            exit(false);
        EXIT(WorkFlowManagement.CanExecuteWorkflow(Applicant, WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentApplicationFormForApprovalCode()));
    end;


    [EventSubscriber(ObjectType::Codeunit::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var recref: RecordRef; var ApprovalEntryArgument: Record "Approval Entry")
    var
        Applicant: Record "Student Application Form";
    begin
        case recref.Number of
            DATABASE::"Student Application Form":
                begin
                    recref.SetTable(Applicant);
                    ApprovalEntryArgument."Document No." := Applicant."Application No.";
                end;
        end;
    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";
        WorkFlowEventHandlingCust: Codeunit "WorkFlowEventHandling";
        NoWorkFlowEnabledErr: TextConst ENU = 'No Approval Workflow for this record type is enabled ';

}