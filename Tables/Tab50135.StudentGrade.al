table 50135 "Students Grade"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Grade Code"; Code[20])
        {
            Caption = 'Grade Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Grade"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Grade';

        }
        field(3; "Minimum Points"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Points';

        }
        field(4; "Maximum Points"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum Points';


        }
    }

    keys
    {
        key(PK; "Grade Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Grade)
        {

        }
        fieldgroup(Brick; Grade)
        {

        }
    }
}