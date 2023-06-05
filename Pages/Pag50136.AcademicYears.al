page 50136 "Academic Years"
{
    Caption = 'Academic Years';
    PageType = List;
    SourceTable = "Academic Years";
    UsageCategory = Lists;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Academic Code"; Rec."Academic Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Code field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
            }
        }
    }
}
