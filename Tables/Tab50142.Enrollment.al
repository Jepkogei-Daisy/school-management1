table 50142 Enrollment
{
    Caption = 'Enrollment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Enrollment ID"; Code[20])
        {
            Caption = 'Enrollment ID';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NNoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Enrollment ID" <> xRec."Enrollment ID" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Enrollment ID");
                    NoseriesManagement.TestManual(StudentMgntSetup."Enrollment ID");
                end;
            end;
        }
        field(2; "Student ID"; Text[20])
        {
            Caption = 'Student Code';
            DataClassification = CustomerContent;
        }
        field(3; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            DataClassification = CustomerContent;
        }
        field(4; "Enrollment Date"; Date)
        {
            Caption = 'Enrollment Date';
            DataClassification = CustomerContent;
        }
        field(5; Status; Text[20])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(6; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Enrollment ID")
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
        if "Enrollment ID" = ' ' then
            StudentMgntSetup.TestField("Enrollment ID");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Enrollment ID", xRec."No. Series", 0D, "Enrollment ID", "No. Series");

    end;

}
