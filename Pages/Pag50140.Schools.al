page 50140 Schools
{
    Caption = 'Schools';
    PageType = List;
    SourceTable = Schools;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("School Code"; Rec."School Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the School Code field.';
                }
                field("School Name"; Rec."School Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the School Name field.';
                }
            }
        }
    }
}
