table 50141 "Units Lines"
{
    Caption = 'Units Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
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
        field(4; "Core Unit"; Boolean)
        {
            Caption = 'Core Unit';
            DataClassification = CustomerContent;
        }
        field(5; "LineNo1"; Integer)
        {
            DataClassification = ToBeClassified;
        }



    }
    keys
    {
        key(PK; "Entry No.", LineNo1)
        {
            Clustered = true;
        }
    }
}
