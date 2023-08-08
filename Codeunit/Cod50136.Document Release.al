codeunit 50136 "Document Release"
{
    procedure CreateStudent(var StudentReg: Record "Student Application Form")
    var
        stud: Record Customer;
        Student: Record StudentMgntSetup;
    begin
        Student.Get();
        stud."Customer Type" := stud."Customer Type"::Students;
        stud.Name := StudentReg."Full Name";
        //stud."No." := StudentReg."Application No.";
        stud."Gen. Bus. Posting Group" := Student."Gen.Bus Posting Group";
        stud."VAT Bus. Posting Group" := Student."VAT.Bus Posting Group";
        stud."Customer Posting Group" := Student."Customer Posting Group";
        stud.TransferFields(StudentReg);
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
            Message('Student Application sucessfull');
            EmailVerification.EmailAdmissionLetter(StudentReg);
            Message('Welcome!');
        end;


    end;

    procedure StudentRegReopen(var StudentReg: Record "Student Application Form")
    var
        StudentExist: Record "Student Application Form";
    begin
        StudentReg."Approval Status" := StudentReg."Approval Status"::Open;
        StudentReg.Modify();


    end;

    // local procedure InsertStudentsEntry(var StudentsList: Record  "Student Application Form")
    //     var
    //         "StudentApplicationList": Record "Student Application Form";
    //         EntryNo: Integer;
    //     begin
    //         if  "StudentApplicationList".FindLast() then
    //             EntryNo :=  "StudentApplicationList"."Entry No." + 1
    //         else
    //             EntryNo := 1;
    //         StudentApplicationList.Init();
    //         StudentApplicationList."Entry No." := EntryNo;
    //         StudentApplicationList.Insert();
    //     end;

    var
        EmailVerification: Codeunit "Email Verification";
}


