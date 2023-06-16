page 50162 "Units Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Units Lines";

    layout
    {
        area(Content)
        {
            repeater(Lines)
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