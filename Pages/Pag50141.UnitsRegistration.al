page 50141 "Units Registration"
{
    Caption = 'Units Registration';
    PageType = List;
    SourceTable = "Units Registration";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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
