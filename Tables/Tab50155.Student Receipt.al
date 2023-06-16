table 50155 "Student Receipt"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "StudentMgntSetup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Receipt No." <> xRec."Receipt No." then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Receipt No.");
                    NoseriesManagement.TestManual(StudentMgntSetup."Receipt No.");
                end;
            end;
        }
        field(2; "Application No."; Code[20])
        {
            Caption = 'Received From';
            DataClassification = CustomerContent;
            TableRelation = Customer where("Customer Type" = filter(students));
        }
        field(3; "Student Name"; code[50])
        {
            Caption = 'Student Name';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(4; "Receipt Date"; Date)
        {
            Caption = 'Reciept Date';
            DataClassification = CustomerContent;
        }
        field(5; "Payment Method"; Code[20])
        {
            Caption = 'Payment Method';
            DataClassification = CustomerContent;
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(7; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(8; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(9; "Approval Status"; Enum "ApprovalStatus")
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Status';
            Editable = false;

        }
        field(10; "Posted"; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
            Enabled = true;
            DataClassification = CustomerContent;
        }


    }
    keys
    {
        key(PK; "Receipt No.")
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
        if "Receipt No." = ' ' then
            StudentMgntSetup.TestField("Receipt No.");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Receipt No.", xRec."No. Series", 0D, "Receipt No.", "No. Series");

    end;

}