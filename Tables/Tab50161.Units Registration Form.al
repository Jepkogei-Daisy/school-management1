table 50161 "Units Registration Form"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registration Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Registration Code" <> xRec."Registration Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Registration Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Registration Code");
                end;
            end;

        }
        field(2; "Application No."; Code[20])
        {
            Caption = 'Student No.';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(8; "Session Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Session Code';
            TableRelation = "Session Card";
        }
        field(3; "Student Name"; code[50])
        {
            Caption = 'Student Name';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(4; "Course Name"; Text[50])
        {
            Caption = 'Course';
            Editable = false;
            //TableRelation = Courses;
            DataClassification = CustomerContent;
        }
        field(5; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Academic Years";
            Caption = 'Academic Year';
            Editable = false;
        }
        field(6; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Semesters;
            Caption = 'Semester';
            Editable = false;
        }
        field(7; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Registration Code")
        {
            Clustered = true;
        }
    }
    var

        StudentMgntSetup: Record "StudentMgntSetup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        StudentMgntSetup: Record "StudentMgntSetup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        StudentMgntSetup.Get();
        if "Registration Code" = ' ' then
            StudentMgntSetup.TestField("Registration Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Registration Code", xRec."No. Series", 0D, "Registration Code", "No. Series");

    end;

}