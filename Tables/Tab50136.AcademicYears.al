table 50136 "Academic Years"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Academic Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Code';
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Academic Code" <> xRec."Academic Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Academic Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Course Code");
                end;
            end;

        }
        field(2; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';

        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;

        }

    }
    keys
    {
        key(PK; "Academic Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Academic Year")
        {

        }
        fieldgroup(Brick; "Academic Year")
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
        if "Academic Code" = ' ' then
            StudentMgntSetup.TestField("Academic Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Academic Code", xRec."No. Series", 0D, "Academic Code", "No. Series");

    end;


}


