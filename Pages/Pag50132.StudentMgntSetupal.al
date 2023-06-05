page 50132 "StudentMgntSetup"
{
    Caption = 'StudentMgntSetup';
    PageType = Card;
    SourceTable = StudentMgntSetup;
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No. field.';


                }
                field("Minimun Age"; Rec."Minimun Age")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimun Age field.';
                }
                field("Maximum Age"; Rec."Maximum Age")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Age field.';
                }
                field("School Code"; Rec."School Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the schol code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the department code field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the course code field.';
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit code field.';

                }
                field("Academic Code"; Rec."Academic Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic code field.';
                }
                field("Semester Code"; Rec."Semester Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester code field.';
                }
                field("Enrollment ID"; Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Enrollment ID field.';
                }
                field("Level Code"; Rec."Level Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the level code field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.insert();
        end
    end;
}
