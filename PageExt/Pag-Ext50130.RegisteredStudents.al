pageextension 50130 "Registered Students" extends "Customer Card"
{

    layout
    {
        addafter(Name)
        {

            field("Date of Birth"; Rec."Date of Birth")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date of Birth field.';
            }
            field(Age; Rec.Age)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Age field.';
            }
            field(Nationality; Rec.Nationality)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Nationality field.';
            }
            field("National ID"; Rec."National ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the National ID field.';
            }

            field(Level; Rec.Level)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Level field.';
            }
            field("Course Name"; Rec."Course Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Course Name field.';
            }
            field(School; Rec.School)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the School field.';
            }
            field(Department; Rec.Department)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Department field.';
            }
        }
    }


    actions
    {
        // Add changes to page actions here
    }


    var
        myInt: Integer;
}


