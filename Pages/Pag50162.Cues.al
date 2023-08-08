page 50163 "Cues"
{
    PageType = Cardpart;
    ApplicationArea = Suite;
    UsageCategory = Administration;
    SourceTable = Cues;


    layout
    {
        area(Content)
        {
            cuegroup(Approvals)
            {
                field(Sessions; Rec.Sessions)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the value of the Sessions list field.';
                    DrillDownPageId = "Students in Session";
                }
                field("Student Invoice"; Rec."Student Invoice")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the value of the Invoices field.';
                    DrillDownPageId = "Students Invoices";
                }
                field("unit Matrix"; Rec."unit Matrix")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the value of the Unit Matrix field.';
                    DrillDownPageId = UnitMatrix;
                }

                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Status field.';
                    DrillDownPageId = "List of Registered Students";
                }
                field("Pending Approvals"; Rec."Pending Approvals")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Approvals field.';
                    DrillDownPageId = "Pending Approval FactBox";
                }
                field("Rejected Approval"; Rec."Rejected Approval")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rejected Approval field.';
                    DrillDownPageId = Approvals;
                }
                field("Canceled Approvals"; Rec."Canceled Approvals")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Canceled Approvals field.';
                    DrillDownPageId = Approvals;
                }

            }
        }
    }
}