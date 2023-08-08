page 50145 UnitMatrix
{
    Caption = 'UnitMatrix';
    PageType = List;
    SourceTable = "Unit Matrix";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Unit code"; Rec."Unit code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Unit: Record Units;
                    begin
                        if Page.RunModal(Page::Units, Unit) = Action::LookupOK then
                            Rec."Unit code" := Unit."Unit Code";
                        Rec."Unit Name" := Unit."Unit Name";

                    end;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Name field.';

                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Unit: Record Courses;
                    begin
                        if Page.RunModal(Page::Courses, Unit) = Action::LookupOK then
                            Rec."Course Name" := Unit."Course Name";
                        Rec."School Name" := Unit.School;
                        Rec."Department Name" := Unit.Department;

                    end;
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Unit: Record "Academic Years";
                    begin
                        if Page.RunModal(Page::"Academic Years", Unit) = Action::LookupOK then
                            Rec."Academic Year" := Unit."Academic Year";
                    end;
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the semester field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Unit: Record "Semesters";
                    begin
                        if Page.RunModal(Page::"Semesters", Unit) = Action::LookupOK then
                            Rec."Semester Name" := Unit."Semester Name";
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("School Name"; Rec."School Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the School Name field.';
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
