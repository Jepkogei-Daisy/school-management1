codeunit 50136 "Document Release"
{
    procedure CreateStudent(var StudentReg: Record "Student Application Form")
    var
        stud: Record Customer;
    begin
        stud."Customer Type" := stud."Customer Type"::Students;
        stud.Name := StudentReg."Full Name";
        stud."No." := StudentReg."Application No.";
        // stud."Gen. Bus. Posting Group" :=Student."Gen.Bus Posting Group";
        // stud."VAT Bus. Posting Group" :=Student."VAT.Bus Posting Group";
        // stud."Customer Posting Group" :=Student. "Customer Posting Group";
        // stud.TransferFields(StudentReg);
        Stud.Insert(true);
    end;

    procedure StudentRegApproved(var StudentReg: Record "Student Application Form")
    var
        StudentExist: Record "Student Application Form";
    begin
        StudentExist.Reset();
        StudentExist.SetRange("Application No.", StudentReg."Application No.");
        if StudentExist.FindFirst() then begin
            StudentExist."Approval Status" := StudentExist."Approval Status"::"Approved";
            StudentExist.Modify();
            CreateStudent(StudentExist);
        end;


    end;

    procedure StudentRegReopen(var StudentReg: Record "Student Application Form")
    var
        StudentExist: Record "Student Application Form";
    begin
        StudentReg."Approval Status" := StudentReg."Approval Status"::Open;
        StudentReg.Modify();


    end;


}

