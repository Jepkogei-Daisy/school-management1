table 50140 Schools
{
    Caption = 'Schools';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "School Code"; Code[20])
        {
            Caption = 'School Code';
            Editable = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "School Code" <> xRec."School Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("School Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."School Code");
                end;
            end;
        }
        field(2; "School Name"; Text[50])
        {
            Caption = 'School Name';
            DataClassification = CustomerContent;
        }

        field(3; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "School Code")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "School Name")
        {

        }
        fieldgroup(Brick; "School Name")
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
        if "School Code" = ' ' then
            StudentMgntSetup.TestField("School Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."School Code", xRec."No. Series", 0D, "School Code", "No. Series");

    end;
}
