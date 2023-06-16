table 50157 "Invoice Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Student Invoice";
        }
        field(2; "Payment Type"; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
            TableRelation = "Fee Structure";
        }
        field(3; "Description"; code[50])
        {
            Caption = 'Description';
            TableRelation = "Fee Structure";
            DataClassification = CustomerContent;
        }
        field(4; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Amount';
        }
        field(5; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}