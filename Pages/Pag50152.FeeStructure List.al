page 50152 "Fee Structure List"
{
    Caption = 'Fee Structure';
    PageType = List;
    SourceTable = "Fee Structure";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FeeStructure: Record "Academic Years";
                    begin

                        if Page.RunModal(Page::"Academic Years", FeeStructure) = Action::LookupOK then
                            Rec."Academic Year" := FeeStructure."Academic Year";
                    end;
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FeeStructure: Record Semesters;
                    begin

                        if Page.RunModal(Page::Semesters, FeeStructure) = Action::LookupOK then
                            Rec."Semester Name" := FeeStructure."Semester Name";
                    end;
                }
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Category field.';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Recurring Change"; Rec."Recurring Change")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the recurring change of the field';
                }
            }
        }
    }
}
