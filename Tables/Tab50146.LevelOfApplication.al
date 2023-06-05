table 50146 "LevelOfApplication"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Level Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Level Code';
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Level Code" <> xRec."Level Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Level Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Level Code");
                end;
            end;

        }
        field(2; "Level Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Level Name';
        }
        field(3; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Level Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Level Name")
        {

        }
        fieldgroup(Bricks; "Level Name")
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
        if "Level Code" = ' ' then
            StudentMgntSetup.TestField("Level Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Level Code", xRec."No. Series", 0D, "Level Code", "No. Series");

    end;


}