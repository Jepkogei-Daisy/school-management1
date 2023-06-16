page 50159 "Receipt Lines"
{
    Caption = 'Receipt Lines';
    PageType = Card;
    SourceTable = "Receipt Lines";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                // field("Payment Type"; Rec."Payment Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Payment Type field.';
                // }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
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
