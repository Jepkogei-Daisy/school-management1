page 50161 "Units Registration Form"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Units Registration Form";

    layout
    {
        area(Content)
        {
            group("Registration Details")
            {

                field("Registration Code"; Rec."Registration Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Code field.';
                }
                field("Session Code"; Rec."Session Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the session Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        unitsregistrationform: Record "Session Card";
                    begin
                        if Page.RunModal(Page::"Students in Session", unitsregistrationform) = Action::LookupOK then
                            Rec."session code" := unitsregistrationform."Session Code";
                        Rec."Course Name" := unitsregistrationform."Course Name";
                        Rec."Academic Year" := unitsregistrationform."Academic Year";
                        Rec."Semester Name" := unitsregistrationform."Semester Name";
                        Rec."Application No." := unitsregistrationform."Application No.";
                        Rec."Student Name" := unitsregistrationform."Full Name";

                    end;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                }
            }
            part(Unit; "Units Subform")
            {
                SubPageLink = "Entry No." = field("Registration Code");
                ApplicationArea = All;
            }
        }
    }

}
