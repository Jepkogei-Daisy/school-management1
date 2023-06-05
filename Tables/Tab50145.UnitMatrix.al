table 50145 "Unit Matrix"
{
    Caption = 'Unit Matrix';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Unit code"; Code[20])
        {
            Caption = 'Unit code';
            DataClassification = CustomerContent;
        }
        field(2; "Unit Name"; Code[50])
        {
            Caption = 'Unit Name';
            DataClassification = CustomerContent;
        }
        field(3; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            DataClassification = CustomerContent;
        }
        field(4; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            DataClassification = CustomerContent;
        }
        field(5; "Academic Code"; Integer)
        {
            Caption = 'Academic Code';
            DataClassification = CustomerContent;
        }
        field(6; "Academic Year"; code[20])
        {
            Caption = 'Academic Year';
            DataClassification = CustomerContent;
        }
        field(7; "Semester Code"; Code[10])
        {
            Caption = 'Semester Code';
            DataClassification = CustomerContent;
        }
        field(8; "Semester Name"; Code[20])
        {
            Caption = 'Semester Name';
            DataClassification = CustomerContent;
        }
        field(9; "School Code"; Code[20])
        {
            Caption = 'School Code';
            DataClassification = CustomerContent;
        }
        field(10; "School Name"; Text[50])
        {
            Caption = 'School Name';
            DataClassification = CustomerContent;
        }
        field(11; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
        }
        field(12; "Department Name"; Text[50])
        {
            Caption = 'Department Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Unit code")
        {
            Clustered = true;
        }
    }
}
