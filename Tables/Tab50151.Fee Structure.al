table 50151 "Fee Structure"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fee Structure Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Fee Structure Code" <> xRec."Fee Structure Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Fee Structure Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Fee Structure Code");
                end;
            end;
        }
        field(2; "Fee Structure Name"; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Name';
        }
        field(10; "Description"; code[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Academic Year"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';
            TableRelation = "Academic Years";
        }
        field(4; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Name';
            TableRelation = Semesters;
        }
        field(5; "Student Category"; Enum "Student Category")
        {
            Caption = 'Student Category';
            DataClassification = CustomerContent;
        }
        field(6; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(7; "Bank Account Number"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Type';
        }
        field(8; "Bank Account Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Name';
        }
        field(9; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(13; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(11; "Balancing Acc. No."; Code[20])
        {
            Caption = 'Balancing Acc. No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Bal.Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting), Blocked = const(false))
            else

            if ("Bal.Account Type" = const("G/L Account")) "G/L Account"

            else

            if ("Bal.Account Type" = const(Customer)) customer

            else

            if ("Bal.Account Type" = const(vendor)) vendor

            else

            if ("Bal.Account Type" = const("Bank Account")) "Bank Account";

        }

        field(12; "Payment Type"; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
        }
        field(14; "Recurring Change"; Boolean)
        {
            Caption = 'Recurring Change';
            DataClassification = CustomerContent;
        }
        field(15; "Amount Sum"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Amount Sum';
        }
        field(16; "Serial Number"; Code[20])
        {
            Caption = 'S/NUMBER';
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; "Fee Structure Code")
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
        if "Fee Structure Code" = ' ' then
            StudentMgntSetup.TestField("Fee Structure Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Fee Structure Code", xRec."No. Series", 0D, "Fee Structure Code", "No. Series");

    end;
}