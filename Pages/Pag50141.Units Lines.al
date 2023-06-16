page 50141 "Units Lines"
{
    Caption = 'Units Lines';
    PageType = Card;
    SourceTable = "Units Lines";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the entry number';
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Code field.';
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
            }
        }
    }
}
