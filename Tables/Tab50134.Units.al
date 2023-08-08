table 50134 "Units"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Unit Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Code';
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NNoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Unit Code" <> xRec."Unit Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Unit Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Unit Code");
                end;
            end;

        }

        field(2; "Unit Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Name';
        }
        field(3; "Core Unit"; Boolean)
        {
            Caption = 'Core Unit';
            DataClassification = CustomerContent;
        }
        field(7; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Unit Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Unit Name")
        {

        }
        fieldgroup(Brick; "Unit Name")

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
        if "Unit Code" = ' ' then
            StudentMgntSetup.TestField("Unit Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Unit Code", xRec."No. Series", 0D, "Unit Code", "No. Series");

    end;
}