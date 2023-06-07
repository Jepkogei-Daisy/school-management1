page 50152 "Fee Structure List"
{
    Caption = 'Fee Structure';
    PageType = List;
    SourceTable = "Fee Structure";
    CardPageId = "Fee Structure";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Fee Structure Name"; Rec."Fee Structure Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Name field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Type field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                }
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Category field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }
}
