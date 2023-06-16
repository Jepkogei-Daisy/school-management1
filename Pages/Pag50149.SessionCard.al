page 50149 "Session Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Session Card";
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Session Code"; Rec."Session Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Session field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Session: Record "Student Application Form";
                    begin
                        if page.RunModal(Page::"StudentApplicationList", Session) = Action::LookupOK then
                            Rec."Application No." := Session."Application No.";
                        Rec."Full Name" := Session."Full Name";
                    end;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Session: Record "Academic Years";
                    begin

                        if Page.RunModal(Page::"Academic Years", Session) = Action::LookupOK then
                            Rec."Academic Year" := Session."Academic Year";
                    end;
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Session: Record Semesters;
                    begin

                        if Page.RunModal(Page::Semesters, Session) = Action::LookupOK then
                            Rec."Semester Name" := Session."Semester Name";
                    end;
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Name of the course in the field';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        course: Record Courses;
                    begin
                        course.Reset;
                        if Page.RunModal(Page::Courses, course) = Action::LookupOK then
                            Rec."Course Name" := course."Course Name";
                        Rec."School Name" := course.School;
                        Rec."Department Name" := course.Department;

                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("School Name"; Rec."School Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the School Name field.';
                }
                field("Student category"; Rec."Student category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Category field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Report; Rec.Report)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = true;
                    Tooltip = 'Specifies the report field';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(SessionApprovals)
            {
                Caption = 'Sessions';
                action(SendApp)
                {

                    ApplicationArea = All;
                    Caption = 'Report for Session';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Sesssion Card';

                    trigger OnAction()
                    begin
                        rec.Report := true
                    end;

                }

                action(CancelApp)
                {

                    ApplicationArea = All;
                    Caption = 'Cancel Session';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Session Card';


                    trigger OnAction()
                    var
                        sess: Record "Session Card";
                    begin
                        SessReg(Rec);
                    end;
                }

            }
        }
    }
    procedure SessReg(var sess: Record "Session Card")
    var
        myInt: Integer;
    begin
        with sess do begin
            sess.Report := sess.Report = true;
            sess.Modify();
        end;

    end;
}