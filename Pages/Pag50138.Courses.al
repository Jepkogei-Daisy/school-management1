page 50138 Courses
{
    Caption = 'Courses';
    PageType = List;
    SourceTable = Courses;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name in the level field';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Levels: Record LevelOfApplication;
                    begin
                        if Page.RunModal(Page::"Level of Application", Levels) = Action::LookupOK then
                            Rec."Level" := levels."Level Name";
                    end;
                }
                field(School; Rec.School)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the school field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Course: Record Schools;
                    begin
                        if Page.RunModal(Page::Schools, Course) = Action::LookupOK then
                            Rec."School" := Course."School Name";


                    end;

                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the department field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Course: Record Department;
                    begin
                        if Page.RunModal(Page::Departments, Course) = Action::LookupOK then
                            Rec."Department" := Course."Department Name";


                    end;
                }


            }
        }
    }
}
