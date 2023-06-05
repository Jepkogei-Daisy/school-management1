table 50141 "Units Registration"
{
    Caption = 'Units Registration';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Unit Code"; Text[50])
        {
            Caption = 'Unit Code';
            DataClassification = CustomerContent;
        }
        field(2; "Unit Name"; Text[50])
        {
            Caption = 'Unit Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Unit Code")
        {
            Clustered = true;
        }
    }
}
