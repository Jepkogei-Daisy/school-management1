page 50130 "Student Application Form"
{
    Caption = 'Student Application Form';
    PageType = Card;
    SourceTable = "Student Application Form";

    layout
    {
        area(content)
        {
            group(PersonalInformation)
            {
                Caption = 'Personal Information';
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the the value of the application number field';

                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field("Full Name"; Rec."Full Name")

                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the full name  field';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the nationality of the field';
                }
                field("National ID"; Rec."National ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the national Identification number of the field';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the status of the field';
                }


            }
            group(Address)
            {
                Caption = 'Address';
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the telephone number in the telephone field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail in the field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Postal address in the postal address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the city in the city field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the county in the county field.';
                }

            }
            group(CourseApplication)
            {
                Caption = 'Course Application';
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the student category in the field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the level of education in the level field';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Levels: Record LevelOfApplication;
                    begin

                        if Page.RunModal(Page::"Level of Application", Levels) = Action::LookupOK then
                            Rec."Level" := levels."Level Name";
                    end;
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the course applying for in the course field';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        course: Record Courses;
                    begin
                        course.Reset;
                        course.SetRange(Level, Rec.Level);
                        if Page.RunModal(Page::Courses, course) = Action::LookupOK then
                            Rec."Course Name" := course."Course Name";
                        Rec.School := course.School;
                        Rec.Department := course.Department;

                    end;
                }
                field(School; Rec.School)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the school applying for in the school field';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    TableRelation = "Department";
                    ToolTip = 'Specifies the department applying for in the department field';
                }


            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Approvals)
            {
                Caption = 'Approvals';
                action(SendApp)
                {

                    ApplicationArea = All;
                    Caption = 'Send For Approval';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Student Application Form';


                    trigger OnAction()
                    begin
                        IF ApprovalMgt.CheckStudentApplicationFormApprovalsWorkFlowEnable(Rec) THEN
                            ApprovalMgt.OnSendStudentApplicationFormForApproval(Rec);
                    end;
                }
                action(cancelApp)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel For Approval';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Student Application Form';


                    trigger OnAction()
                    begin
                        ApprovalMgt.OnCancelStudentApplicationFormForApproval(Rec);

                    end;
                }
                action(Released)
                {
                    ApplicationArea = All;
                    Caption = 'Release';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Student Application Form';


                    trigger OnAction()
                    begin


                    end;
                }
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        OpenApprovalEntriesExistForCurrUser := ApproveMagt.HasOpenApprovalEntriesForCurrentUser(Rec.RECORDID);
        OpenApprovalEntriesExist := ApproveMagt.HasOpenApprovalEntries(Rec.RECORDID);
        CanCancelApprovalForRecord := ApproveMagt.CanCancelApprovalForRecord(Rec.RECORDID);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RECORDID, CanSendApprovalForFlow, CanCancelApprovalForFlow);
    end;

    var
        ApprovalMgt: Codeunit "Approval Mgt";
        ApprrovalMgtCut: Codeunit "Approval Mgt";
        WorkFlowWebhookMgt: codeunit "Workflow Webhook Management";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanCancelApprovalForFlow: Boolean;
        CanSendApprovalForFlow: Boolean;
        ApproveMagt: Codeunit "Approvals Mgmt.";
        DocumentRelease: Codeunit "Document Release";




}




