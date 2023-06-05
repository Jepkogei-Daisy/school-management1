table 50138 "Courses"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Course Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Course Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Course Code" <> xRec."Course Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Course Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Course Code");
                end;
            end;

        }
        field(2; "Course Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Course Name';
        }
        field(6; "Level"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = LevelOfApplication;
            Caption = 'Level';
        }
        field(3; "School"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'School';
            TableRelation = "Schools";
        }
        field(4; "Department"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Department';
            TableRelation = "Department";
        }
        field(5; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Course Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Course Name")
        {

        }
        fieldgroup(Brick; "Course Name")
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
        if "Course Code" = ' ' then
            StudentMgntSetup.TestField("Course Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Course Code", xRec."No. Series", 0D, "Course Code", "No. Series");

    end;


}
