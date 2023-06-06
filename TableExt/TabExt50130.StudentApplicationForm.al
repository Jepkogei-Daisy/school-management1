tableextension 50130 "Registered Students" extends Customer
{
    fields
    {
        field(3000; Gender; Enum StudentGender)
        {
            Caption = 'Gender';
            DataClassification = CustomerContent;

        }
        field(3001; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
            DataClassification = CustomerContent;
        }
        field(3002; Age; Integer)
        {
            Caption = 'Age';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(3003; "Nationality"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Nationality';
        }
        field(3004; "National ID"; Integer)
        {
            Caption = 'National ID';
            DataClassification = CustomerContent;
        }
        field(3005; "Level"; Code[50])

        {
            Caption = 'Level';
            TableRelation = "LevelOfApplication";
            DataClassification = CustomerContent;
        }
        field(3006; "School"; Text[50])
        {
            Caption = 'School';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3007; "Department"; Text[50])
        {
            Caption = 'Department';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(3008; "Course Name"; Text[50])
        {
            Caption = 'Course Name';
            TableRelation = Courses where(Level = field("Level"));
            DataClassification = CustomerContent;

        }
        field(3009; "Customer Type"; option)
        {
            OptionMembers = Students,Customers;
            OptionCaption = 'Students, Customers';
            DataClassification = CustomerContent;
        }
    }
}