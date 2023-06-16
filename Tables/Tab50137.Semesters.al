table 50137 "Semesters"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Semester code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Code';
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Semester Code" <> xRec."Semester code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Semester Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Semester Code");
                end;
            end;

        }
        field(2; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester';
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;



        }



    }
    keys
    {
        key(PK; "Semester code")

        {
            Clustered = true;

        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Semester Name")
        {

        }
        fieldgroup(Brick; "Semester Name")
        {

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
        if "Semester Code" = ' ' then
            StudentMgntSetup.TestField("Semester Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Semester Code", xRec."No. Series", 0D, "Semester Code", "No. Series");

    end;

}