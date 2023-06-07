table 50132 "StudentMgntSetup"
{
    Caption = 'StudentMgntSetup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(4; "Application No."; Code[20])
        {
            Caption = 'Application No.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(2; "Minimun Age"; Integer)
        {
            Caption = 'Minimun Age';
            MinValue = 17;
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     if ("Minimun Age" <> 17) then begin
            //         Error('Minumum Age must be 17.');
            //     end;
            // end;

        }
        field(3; "Maximum Age"; Integer)
        {
            Caption = 'Maximum Age';
            MaxValue = 40;
            DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     if ("Maximum Age" <> 40) then begin
            //         Error('Maximu Age must be 40.');
            //     end;
            // end;

        }
        field(5; "School Code"; Code[20])
        {
            Caption = 'School Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(6; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(7; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(8; "Unit Code"; Code[20])
        {
            Caption = 'Unit Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(9; "Academic Code"; Code[20])
        {
            Caption = 'Academic Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(10; "Semester Code"; Code[20])
        {
            Caption = 'Semester Code';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(11; "Enrollment ID"; Code[20])
        {
            Caption = 'Enrolment ID';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(12; "Level Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Level Code';
            TableRelation = "No. Series";
        }
        field(13; "Session Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Session Code';
            TableRelation = "No. Series";

        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
