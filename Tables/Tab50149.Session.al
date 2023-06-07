table 50149 "Session Card"
{
    DataClassification = ToBeClassified;
    Caption = 'Session';

    fields
    {
        field(1; "Session Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Session Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Session Code" <> xRec."Session Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Session Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Session Code");
                end;
            end;

        }
        field(2; "Application No."; Code[20])
        {
            Caption = 'Student No.';
            DataClassification = CustomerContent;
        }
        field(3; "Full Name"; Text[150])
        {
            Caption = 'Student Name';
            DataClassification = CustomerContent;
        }
        field(4; "Academic Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Code';
        }
        field(5; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';
        }
        field(6; "Semester code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Code';
        }
        field(7; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Name';
        }
        field(8; "School Code"; Code[20])
        {
            Caption = 'School Code';
            DataClassification = CustomerContent;
        }
        field(9; "School Name"; Text[50])
        {
            Caption = 'School Name';
            DataClassification = CustomerContent;
        }
        field(10; "Department Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Department Code';
        }
        field(11; "Department Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Department Name';
        }
        field(12; "Student category"; Enum "Student Category")
        {
            DataClassification = CustomerContent;
            Caption = 'Student Category';
        }
        field(13; "Approval Status"; Enum "ApprovalStatus")
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Status';

        }
        field(14; "Report"; Boolean)
        {
            Caption = 'Report';
            Enabled = true;
            DataClassification = CustomerContent;
        }
        field(15; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Session Code")
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
        if "Session Code" = ' ' then
            StudentMgntSetup.TestField("Session Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Session Code", xRec."No. Series", 0D, "Session Code", "No. Series");

    end;

}