page 50134 "Units"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Units;
    Caption = 'Units';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    
                }
                // field(School; Rec.School)
                // {
                //     ApplicationArea = All;
                // }
                // field(Department; Rec.Department)
                // {
                //     ApplicationArea = All;
                // }
                // field("Course Code"; Rec."Course Code")
                // {
                //     ApplicationArea = All;
                // }
            }
        }

    }
}