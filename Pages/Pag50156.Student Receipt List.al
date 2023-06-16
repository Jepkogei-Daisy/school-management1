page 50156 "Student Receipt List"
{
    Caption = 'Student Receipt List';
    PageType = List;
    SourceTable = "Student Receipt";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Student Receipt ";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reciept Date field.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
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
