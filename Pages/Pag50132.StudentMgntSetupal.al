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
                field("Session Code"; Rec."Session Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the session code field.';
                }
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Invoice Code"; Rec."Invoice Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Code field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Registration Code"; Rec."Registration Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Speifies the value of the Registration Code';
                }
                field("General Journal Batch"; Rec."General Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("General Journal Template"; Rec."General Journal Template")
                {
                    ApplicationArea = All;
                }

                field("Invoicing GL Account"; Rec."Invoicing GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoicing GL Account field.';
                }
                field("Gen.Bus Posting Group"; Rec."Gen.Bus Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen.Bus Posting Group field.';
                }
                field("VAT.Bus Posting Group"; Rec."VAT.Bus Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT.Bus Posting Group field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
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
