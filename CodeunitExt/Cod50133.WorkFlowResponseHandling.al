codeunit 50133 "WorkFlowResponseHandling"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Applicant: Record "Student Application Form";
        DocumentRelease: Codeunit "Document Release";
        Applicant1: Record "Student Invoice";
        FinanceManagement: Codeunit "Finance Management";

        Varvariant: variant;
    begin
        Varvariant := RecRef;
        case RecRef.number of
            DATABASE::"Student Application Form":
                begin
                    // RecRef.SetTable(Applicant);
                    // Applicant."Approval Status" := Applicant."Approval Status"::Open;
                    // Applicant.Modify;
                    // Handled := true;
                    // //DocumentRelease:=
                    Applicant.SetView(RecRef.GetView());
                    Handled := true;
                    DocumentRelease.StudentRegApproved(Varvariant);
                end;

            Database::"Student Invoice":
                begin
                    Applicant1.SetView(RecRef.GetView());
                    Handled := true;
                    FinanceManagement.PostStudentInvoice(Varvariant);
                end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Applicant: Record "Student Application Form";
        documentRelease: Codeunit "Document Release";
        Applicant1: Record "Student Invoice";
        FinanceManagement: Codeunit "Finance Management";
        Varvariant: variant;


    begin
        Varvariant := RecRef;
        case RecRef.number of
            DATABASE::"Student Application Form":
                begin
                    Applicant.SetView(RecRef.GetView());
                    Handled := true;
                    documentRelease.StudentRegApproved(Varvariant);
                end;
            Database::"Student Invoice":
                begin
                    Applicant1.SetView(RecRef.GetView());
                    Handled := true;
                    FinanceManagement.PostStudentInvoice(Varvariant);

                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit::Codeunit, 1521, 'OnAddWorkFlowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkFlowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkFlowResponseHandling: Codeunit "Workflow Response Handling";
        WorkFlowEventHandlingCust: Codeunit "WorkFlowEventHandling";
    begin
        //student application form
        case ResponseFunctionName of
            WorkFlowResponseHandling.SetStatusToPendingApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SetStatusToPendingApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentApplicationFormForApprovalCode);

            WorkFlowResponseHandling.SendApprovalRequestforApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentApplicationFormForApprovalCode);

            WorkFlowResponseHandling.CancelAllApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CancelAllApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnCancelStudentApplicationFormApprovalCode);

            WorkFlowResponseHandling.OpenDocumentCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.OpenDocumentCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnRejectedStudentApplicationFormApprovalCode);

            WorkFlowResponseHandling.CreateApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CreateApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentApplicationFormForApprovalCode);

        end;
        //Student invoice
        case ResponseFunctionName of
            WorkFlowResponseHandling.SetStatusToPendingApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SetStatusToPendingApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentInvoiceForApprovalCode);

            WorkFlowResponseHandling.SendApprovalRequestforApprovalCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentInvoiceForApprovalCode);

            WorkFlowResponseHandling.CancelAllApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CancelAllApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnCancelStudentInvoiceApprovalCode);

            WorkFlowResponseHandling.OpenDocumentCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.OpenDocumentCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnRejectedStudentInvoiceApprovalCode);

            WorkFlowResponseHandling.CreateApprovalRequestsCode:
                WorkFlowResponseHandling.AddResponsePredecessor(WorkFlowResponseHandling.CreateApprovalRequestsCode,
                WorkFlowEventHandlingCust.RunWorkFlowOnSendStudentInvoiceForApprovalCode);

        end;
    end;

}