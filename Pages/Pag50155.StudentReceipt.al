page 50155 "Student Receipt "
{
    Caption = 'Student Receipt';
    PageType = Card;
    SourceTable = "Student Receipt";
    PromotedActionCategories = 'New,Create,process,Navigate,Post,Invoivce,Send for Approvals, Cancel for Approvals';


    layout
    {
        area(content)
        {
            group(Header)
            {
                Caption = 'General';

                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Received From field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Reciept: Record Customer;
                    begin
                        if page.RunModal(Page::"List of Registered Students", Reciept) = Action::LookupOK then
                            Rec."Application No." := Reciept."No.";
                        Rec."Student Name" := Reciept.Name;

                    end;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reciept Date field.';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Method field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval status.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies posted status.';
                }
            }
            part(lines; "Receipt Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Line No." = field("Receipt No.");
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Approvals)
            {
                Caption = 'Actions';
                action(Post)
                {

                    ApplicationArea = All;
                    Caption = 'Posting';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Student Receipt';


                    trigger OnAction()
                    begin

                    end;
                }

                action(Invoice)
                {
                    ApplicationArea = All;
                    Caption = 'Receipt';
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Student Receipt';


                    trigger OnAction()
                    begin


                    end;
                }

            }
            group("Request For Approvals")
            {
                Caption = 'Approvals';
                action(Request)
                {
                    ApplicationArea = All;
                    Caption = 'Send For Approvals';
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Send for Student receipt Approval';


                    trigger OnAction()
                    begin

                    end;
                }
                action(Cancel)
                {
                    ApplicationArea = All;
                    Caption = 'Cancel For Approvals';
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Cancel Student receipt Approval';


                    trigger OnAction()
                    begin

                    end;
                }
            }
        }
    }
}

