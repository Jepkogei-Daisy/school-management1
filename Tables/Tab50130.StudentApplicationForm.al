table 50130 "Student Application Form"
{
    Caption = 'Student Application Form';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[20])
        {
            Caption = 'Application No.';
            Editable = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Application No." <> xRec."Application No." then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Application No.");
                    NoseriesManagement.TestManual(StudentMgntSetup."Application No.");
                end;
            end;

        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + Surname;
            end;
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + Surname;
            end;
        }
        field(4; Surname; Text[50])
        {
            Caption = 'Surname';
            DataClassification = CustomerContent;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + Surname;
            end;
        }
        field(5; "Full Name"; Text[150])
        {
            Caption = 'Full Name';
            DataClassification = CustomerContent;
            Editable = false;
            trigger Onvalidate()

            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + Surname;
            end;


        }
        field(6; "E-Mail"; Text[50])
        {
            Caption = 'E-Mail';
            DataClassification = CustomerContent;
        }
        field(7; "Telephone"; Integer)
        {
            Caption = 'Telephone';
            DataClassification = CustomerContent;
        }
        field(8; Gender; Enum StudentGender)
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;

        }
        field(9; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Age := Date2DMY(WorkDate, 3) - Date2DMY("Date Of Birth", 3);
                StudentMgntSetup.Get();
                if Age < StudentMgntSetup."Minimun Age" then
                    Error('You age is Below the Minimum Requiered Qualification Age!!!')
                else
                    if age > StudentMgntSetup."Maximum Age" then
                        Error('You age is Above the Maximum Requiered Qualification Age!!!')

            end;
        }
        field(10; Age; Integer)
        {
            Caption = 'Age';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(11; "No. Series"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Nationality"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Nationality';
        }
        field(13; "National ID"; Integer)
        {
            Caption = 'National ID';
            DataClassification = CustomerContent;
        }
        field(14; "Level"; Code[50])

        {
            Caption = 'Level';
            TableRelation = "LevelOfApplication";
            DataClassification = CustomerContent;
            //optionMembers=Certificate,Diploma,BachelorsDegree,MastersDegree,DoctoralDegree;
        }
        field(15; "School"; Text[50])
        {
            Caption = 'School';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(16; "Department"; Text[50])
        {
            Caption = 'Department';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(17; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            TableRelation = Courses where(Level = field("Level"));
            DataClassification = CustomerContent;

        }
        field(18; "Postal Address"; Code[20])
        {
            Caption = 'Postal Address';
            DataClassification = CustomerContent;

        }
        field(19; "City"; Text[20])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }
        field(20; "County"; Text[20])
        {
            Caption = 'County';
            DataClassification = CustomerContent;
        }
        field(23; "Approval Status"; Enum "ApprovalStatus")
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Status';
        }



    }
    keys
    {
        key(PK; "Application No.")
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
        if "Application No." = ' ' then
            StudentMgntSetup.TestField("Application No.");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Application No.", xRec."No. Series", 0D, "Application No.", "No. Series");

    end;


}
