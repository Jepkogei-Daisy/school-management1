page 50151 "Fee Structure"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Fee Structure";

    layout
    {
        area(Content)
        {
            group(FeeStructure)
            {
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Fee Structure Name"; Rec."Fee Structure Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Name field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                }
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Category field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Name field.';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account Type field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }

                field(Amount; Rec.Amount)

                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Bal.Account Type"; Rec."Bal.Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of balancing account in the field.';
                }
                field("Balancing Acc. No."; Rec."Balancing Acc. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the balancing account number of the field';
                }

            }
        }
    }
}