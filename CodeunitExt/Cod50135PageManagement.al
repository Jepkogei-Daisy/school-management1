codeunit 50135 "PageManagement"
{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', true, true)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageId: Integer)
    begin
        if PageId = 0 then
            PageId := GetConditionalCardPageID(RecordRef);
    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    begin
        case RecordRef.number of
            DATABASE::"Student Application Form":
                exit(Page::"Student Application Form");
        end;
    end;

}