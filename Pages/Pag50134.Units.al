page 50134 "Units"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Units;
    Caption = 'Units';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                }
                field("Core Unit"; Rec."Core Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Core Unit field.';
                }


            }
        }

    }

}