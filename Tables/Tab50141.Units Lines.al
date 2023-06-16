table 50141 "Units Lines"
{
    Caption = 'Units Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; code[50])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Unit Code"; code[20])
        {
            Caption = 'Unit Code';
            DataClassification = CustomerContent;
        }
        field(3; "Unit Name"; code[50])
        {
            Caption = 'Unit Name';
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
