codeunit 50138 "Payment Management"
{
    procedure PostStudentReceipt(Rct: Record "Student Receipt")
    var
        LineNo: Integer;
        JornalBatch: Record "Gen. Journal Batch";
        StudentManagement: Record StudentMgntSetup;
        GeneralJournalLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register";
        ReceiptLines: Record "Receipt Lines";
        StudentInvoice: Record "Student Invoice";
        CustomerLedger: Record "Cust. Ledger Entry";
        Receiptlns1: Label '%1 has already been posted!';
        Receiptlns2: Label 'Are you sure you want to post %1';
        Receiptlns3: Label 'Invoice has not been approved!Kindly approve before posting';
    begin
        with Rct do begin
            if not Confirm(Receiptlns2, false, "Receipt No.") then
                exit;
            if Posted then
                //     Error(Invoicelns1, "Invoice Code");
                if "Approval Status" <> "Approval Status"::Approved then
                    //     Error(Invoicelns3);
                    StudentManagement.Get();
            // StudentManagement.TestField("General Journal Batch");
            // StudentManagement.TestField("General Journal Template");
            // StudentManagement.TestField("Invoicing GL Account");

            Rct.TestField("Posting Date");
            Rct.TestField("Application No.");

            JornalBatch.Init();
            JornalBatch."Journal Template Name" := StudentManagement."General Journal Template";
            JornalBatch.Name := "Receipt No.";
            if not JornalBatch.Get(StudentManagement."General Journal Template", "Receipt No.") then
                JornalBatch.Insert;

            Receiptlines.Reset();
            ReceiptLines.SetRange("Line No.", "Receipt No.");
            if ReceiptLines.FindSet() then begin
                repeat
                    StudentInvoice.Get(ReceiptLines."Invoice Code");

                    LineNo := LineNo + 1000;
                    GeneralJournalLine.Init();
                    GeneralJournalLine."Journal Template Name" := JornalBatch."Journal Template Name";
                    GeneralJournalLine."Journal Batch Name" := JornalBatch.Name;
                    GeneralJournalLine."Line No." := LineNo;

                    //credit
                    // GeneralJournalLine."Bal. Account Type" := StudentInvoice."Bal.Account Type";
                    //  GeneralJournalLine."Account No." := StudentInvoice."Balancing Acc. No.";
                    GeneralJournalLine."Posting Date" := "Posting Date";
                    GeneralJournalLine."Document No." := ReceiptLines."Line No.";
                    GeneralJournalLine.Amount := ReceiptLines.Amount;
                    GeneralJournalLine.Description := StrSubstNo('%1 for invoice reference No. %2', ReceiptLines."Line No.");
                    Message(Format(Amount));
                    //dedit
                    GeneralJournalLine."Bal. Account Type" := GeneralJournalLine."Bal. Account Type"::Customer;
                    GeneralJournalLine."Bal. Account No." := "Application No.";
                    GeneralJournalLine.Amount := -Round(ReceiptLines.Amount);
                    GeneralJournalLine.Validate(Amount);
                    Message(Format(Amount));

                    if GeneralJournalLine.Amount <> 0 then
                        GeneralJournalLine.Insert;
                until ReceiptLines.Next() = 0;
            end;
        end;
        GeneralJournalLine.Reset();
        GeneralJournalLine.SetRange("Journal Template Name", StudentManagement."General journal Template");
        GeneralJournalLine.SetRange("Journal Batch Name", Rct."Receipt No.");

        GLRegister.Reset();
        GLRegister.SetRange("Journal Batch Name", Rct."Receipt No.");
        if GLRegister.Find('-') then begin
            Rct.Posted := true;
            Rct.Modify();

            //insert document number as invoice upon posting and customer type as student
            CustomerLedger.Reset();
            CustomerLedger.SetRange("Document No.", Rct."Receipt No.");
            if CustomerLedger.FindSet() then begin
                CustomerLedger."Document Type" := CustomerLedger."Document Type"::Invoice;
                //CustomerLedger."Customer Type" :=CustomerLedger."Customer Type"::Student;
                CustomerLedger.Modify();
            end;
        end;
    end;







}