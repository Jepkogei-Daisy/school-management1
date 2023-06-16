page 50133 "StudentApplicationList"
{
    Caption = 'StudentApplicationList';
    PageType = List;
    SourceTable = "Student Application Form";
    CardPageId = "Student Application Form";
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the the value of the application number field';

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the full name  field';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                // field(Age; Rec.Age)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Age field.';
                // }
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the student category in the field';
                }
            }
        }
    }
}
