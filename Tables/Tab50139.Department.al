table 50139 "Department"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Department Code';
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Department Code" <> xRec."Department Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Department Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Department Code");
                end;
            end;
        }
        field(2; "Department Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Name';
           
            


        }

        field(3; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Department Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Department Name")
        {

        }
        fieldgroup(Brick; "Department Name")
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
        if "Department Code" = ' ' then
            StudentMgntSetup.TestField("Department Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Department Code", xRec."No. Series", 0D, "Department Code", "No. Series");

    end;


}