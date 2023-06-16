page 50160 "Receipt Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Receipt Lines";


    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
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