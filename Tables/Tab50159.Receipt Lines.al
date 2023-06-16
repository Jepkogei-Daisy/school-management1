table 50159 "Receipt Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
        }
        field(2; "Payment Type"; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
        }
        field(3; "Description"; code[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
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
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }

}