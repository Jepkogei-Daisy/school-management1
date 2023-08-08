table 50163 "Cues"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Pending Approvals"; Integer)
        {
            CalcFormula = count("Student Application Form" where("Approval Status" = const("Pending Approval")));
            FieldClass = FlowField;
            Caption = 'Pending Approvals';

        }
        field(3; "Approved"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Approved Status';
            CalcFormula = count("Student Application Form" where("Approval Status" = const(Approved)));

        }
        field(4; "Rejected Approval"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Rejected Approval';
            CalcFormula = count("Student Application Form" where("Approval Status" = const(Rejected)));


        }
        field(5; "Canceled Approvals"; Integer)
        {
            CalcFormula = count("Student Application Form" where("Approval Status" = const(Canceled)));
            FieldClass = FlowField;
            Caption = 'Canceled Approvals';
        }
        field(6; "unit Matrix"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Unit Matrix';
            CalcFormula = count("Unit Matrix" where("Academic Year" = filter('2023/2024')));
        }
        field(7; "Student Invoice"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Student Invoice");
            Caption = 'Invoices';
        }
        field(8; "Sessions"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Session Card");
            Caption = 'Sessions list';
        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }



    }

}