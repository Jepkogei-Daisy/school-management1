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
            repeater(GroupName)
            {
                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     units1: Record "Unit Matrix";
                    // begin
                    //     if Page.RunModal(Page::UnitMatrix, units1) = Action::LookupOK then
                    //         Rec."school" := units1."School Name";
                    //     Rec."Course Name" := units1."Course Name";
                    //     Rec."Academic Year" := units1."Academic Year";
                    //     Rec."Semester Name" := units1."Semester Name";
                    //     Rec.Department := units1."Department Name";
                    //     Rec."Unit Name" := units1."Unit Name";

                    // end;


                }
                // field(School; Rec.School)
                // {
                //     ApplicationArea = All;
                // }
                // field(Department; Rec.Department)
                // {
                //     ApplicationArea = All;
                // }
                // field("Course Name"; Rec."Course Name")
                // {
                //     ApplicationArea = All;
                // }

                // field("Academic Year"; Rec."Academic Year")
                // {
                //     ApplicationArea = All;
                // }
                // field("Semester Name"; Rec."Semester Name")
                // {
                //     ApplicationArea = All;
                // }
            }
        }

    }

}