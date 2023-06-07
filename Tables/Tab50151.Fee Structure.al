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
        }
        field(2; "Fee Structure Name"; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Name';
        }
        field(3; "Academic Year"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';
        }
        field(4; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Name';
        }
        field(5; "Student Category"; Enum "Student Category")
        {
            Caption = 'Student Category';
            DataClassification = CustomerContent;
        }
        field(6; "Amount"; Code[50])
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


    }

    keys
    {
        key(PK; "Fee Structure Code")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}