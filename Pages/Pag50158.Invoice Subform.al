page 50158 "Invoice Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Invoice Lines";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Invoice: Record "Fee Structure";
                    begin

                        if Page.RunModal(Page::"Fee Structure List", Invoice) = Action::LookupOK then
                            Rec."Description" := Invoice.Description;
                        Rec.Amount := Invoice.Amount;

                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }

            }
        }
    }
}