page 50142 Enrollment
{
    Caption = 'Enrollment';
    PageType = List;
    SourceTable = Enrollment;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Enrollment ID"; Rec."Enrollment ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Enrollment ID field.';
                }
                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student ID field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Enrollment Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
