// codeunit 50134 "WorkFlowSetUp"
// {
//     trigger OnRun()
//     begin

//     end;


//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow SetUp", 'OnAddWorkFlowCategoriesToLibrary', '', true, true)]
//     local procedure OnAddWorkFlowCategoriesToLibrary()
//     begin
//         WorkFlowSetup.InsertWorkFlowCategory(StudentApplicationFormWorkFlowCategoryTxt, StudentApplicationFormWorkFlowCategoryDescTxt);
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow SetUp", 'OnAfterInsertApprovalsTableRelations', '', true, true)]
//     local procedure OnAfterInsertApprovalsTableRelations()
//     var
//         ApprovalEntry: Record "Approval Entry";
//     begin
//         WorkFlowSetup.InsertTableRelation(Database::"Student Application Form", 0, Database::"Approval Entry", Approvalentry.FIELDNO("Record ID to approve"));
//     end;

//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"WorkFlow SetUp", 'OnInsertWorkFlowTemplates', '', true, true)]
//     local procedure OnInsertWorkFlowTemplates()

//     begin
//         InserStudentApplicationFormApprovalWorkFlowTemplate();
//     end;

//     local procedure InsertStudentApplicationFormWorkFlowTemplate()
//     var
//         WorkFlow: Record Workflow;
//     begin
//         WorkFlowSetup.InsertWorkFlowTemplate(WorkFlow, StudentApplicationFormApprWorkFlowCodeTxt, StudentApplicationFormApprWorkFlowDescTxt, 
//         StudentApplicationFormWorkFlowCategoryTxt);
//         InsertStudentApplicationFormWorkFlowDetails(WorkFlow);
//         WorkFlowSetup.MarkWorkFlowAsTemplate(WorkFlow);
//     end;

//     local procedure InsertStudentApplicationFormWorkFlowDetails(var WorkFlow: Record Workflow)
//     var
//         WorkFlowStepArgument: Record "Workflow Step Argument";
//         BlankDateFormula: DateFormula;
//         WorkFlowEventHandlingCust: Codeunit "WorkFlowEventHandling";
//         WorkflowResponseHandling: Codeunit "Workflow Response Handling";
//         Applicant: Record "Student Application Form";
//     begin
//         WorkFlowSetup.PopulateWorkFlowStepArgument(WorkFlowStepArgument, WorkFlowStepArgument."Approval Limit Type"::"Direct Approver", 0, '',
//         BlankDateFormula, TRUE);
//         WorkFlowSetup.InsertDocApprovalWorkflowSteps(
//             WorkFlow,
//             BuildStudentApplicationFormTypeConditions(Applicant."Approval Status"::Open),
//     WorkFlowEventHandlingCust.RunWorkApprovalFlowOnSendStudentApplicationFormForApprovalCode,
//              BuildStudentApplicationFormTypeConditions(Applicant."Approval Status"::"Pending Approval"),
//         WorkFlowEventHandlingCust.RunWorkApprovalFlowOnCancelStudentApplicationFormApprovalCode,
//         WorkFlowStepArgument,
//         TRUE);
//     end;

//     local procedure BuildStudentApplicationFormTypeConditions(Status: Integer): Text
//     var
//         Applicant: Record "Student Application Form";
//     begin
//         Applicant.SetRange("Approval Status", Status);
//         exit(StrSubstNo(StudentApplicationFormTypeCondnTxt, WorkFlowStep.Encode(Applicant.GetView(false))));
//     end;

//     var
//         WorkFlowSetup: Codeunit "Workflow Setup";
//         StudentApplicationFormWorkFlowCategoryTxt: Textconst ENU = 'ADW';
//         StudentApplicationFormWorkFlowCategoryDescTxt: Textconst ENU = 'Student Application form Document';
//         StudentApplicationFormApprovalWorkFlowCategoryTxt: Textconst ENU = 'AAPW';
//         StudentApplicationFormApprovalWorkFlowCategoryDescTxt: Textconst ENU = 'Student Management Approval document';
//     //StudentApplicationFormTypeCondnTxt: Textconst ENU=;


// }
