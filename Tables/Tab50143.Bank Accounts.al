table 50143 Fee
{
    Caption = 'Fee';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Fee ID"; Text[50])
        {
            Caption = 'Fee ID';
            DataClassification = CustomerContent;
        }
        field(2; "Student ID"; Text[20])
        {
            Caption = 'Student ID';
            DataClassification = CustomerContent;
        }
        field(3; "Fee Type"; Text[50])
        {
            Caption = 'Fee Type';
            DataClassification = CustomerContent;
        }
        field(4; Amount; Text[50])
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(5; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
            DataClassification = CustomerContent;
        }
        field(6; Status; Text[50])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Fee ID")
        {
            Clustered = true;
        }
    }
}
