codeunit 50136 "Document Release"
{
    procedure CreateStudent(var StudentReg: Record "Student Application Form")
    var
        stud: Record Customer;
        Student: Record "Student Application Form";
    begin

        //Student.GET(''); 
        if StudentReg."Approval Status" = StudentReg."Approval Status"::"Pending Approval"
        then begin
            Student.init();
            stud."Customer Type" := stud."Customer Type"::Students;
            stud.Name := Student."Full Name";
            // stud."Gen. Bus. Posting Group" :=Student."Gen.Bus Posting Group";
            // stud."VAT Bus. Posting Group" :=Student."VAT.Bus Posting Group";
            // stud."Customer Posting Group" :=Student. "Customer Posting Group";
            stud.TransferFields(StudentReg);
            Stud.Insert();
        end;
    end;

    procedure StudentRegApproved(var StudentReg: Record "Student Application Form")
    var
        StudentExist: Record "Student Application Form";
    begin
        StudentReg."Approval Status" := StudentReg."Approval Status"::"Pending Approval";
        StudentReg.Modify();
        CreateStudent(StudentReg);

    end;

    procedure StudentRegReopen(var StudentReg: Record "Student Application Form")
    var
        StudentExist: Record "Student Application Form";
    begin
        StudentReg."Approval Status" := StudentReg."Approval Status"::Open;
        StudentReg.Modify();


    end;


}

