codeunit 50137 "Email Verification"
{
    trigger OnRun()
    begin

    end;

    var
        Email: Codeunit Email;
        EmailM: Codeunit "Email Message";
        Recipient: Text;
        InStr: InStream;
        OutStr: OutStream;
        TextBdr: TextBuilder;
        Base64Convert: Codeunit "Base64 Convert";
        Recref: RecordRef;
        BodyTxt: Text;
        Location: Text;
        Filename: Text;
        Subject: Text;
        File1: File;
        CompInf: Record "Company Information";
        Emaili: Codeunit Email;

    procedure EmailAdmissionLetter(ApplicantRec: record "Student Application Form")

    var
        AdmissionLetter: Report "Application Letter";
        FilePath: Text;
        AppRec: Record "Student Application Form";
    begin
        if ApplicantRec."Approval Status" = ApplicantRec."Approval Status"::Approved then begin
            Clear(EmailM);
            Clear(TextBdr);
            Clear(Recipient);
            Clear(Email);
            Clear(BodyTxt);
            Clear(Subject);
            Clear(Recref);
            CompInf.Get();
            if Recref.Get(ApplicantRec.RecordId) then
                Recipient := ApplicantRec."E-Mail";
            Subject := 'Admission Letter';
            TextBdr.AppendLine('Dear' + ApplicantRec."Full Name");
            TextBdr.AppendLine();// NewLine
            TextBdr.AppendLine('Find your attached document letter here');
            TextBdr.AppendLine(); //NewLine
            TextBdr.AppendLine('Kind Regards,');
            TextBdr.AppendLine(); //NewLine
            TextBdr.AppendLine(CompInf.Name);
            BodyTxt := TextBdr.ToText();
            Location := TemporaryPath + 'Admission Letter.pdf';
            AppRec.Reset();
            AppRec.SetRange("Application No.", ApplicantRec."Application No.");
            if AppRec.FindFirst() then;
            Clear(AdmissionLetter);
            AdmissionLetter.settableview(AppRec);
            AdmissionLetter.SaveAsPdf(Location);
            File1.Open(Location);
            File1.CreateInStream(InStr);
            EmailM.Create(Recipient, Subject, BodyTxt, false);
            EmailM.AddAttachment(Location, 'pdf', InStr);
            Emaili.Send(EmailM);
            File1.Close();
        end;



    end;

}