codeunit 50140 "Populate Units"

{
    procedure SuggestLines(Units: Record "Units Registration Form")
    var
        UnitM: Record "Unit Matrix";
        Unit: Record "Units Lines";
        unitlines: Record "Units Lines";
        LineNo1: Integer;
    begin
        //RemoveUnit(Units);
        UnitM.Reset();
        UnitM.SetRange("Semester Code", Units."Semester Name");
        if UnitM.FindSet() then begin
            repeat
                LineNo1 := LineNo1 + 1000;
                Unit.Reset();
                Unit.SetRange("Unit Code", UnitM."Unit code");
                // Unit.SetRange(, true);
                if not Unit.FindFirst() then begin
                    unitlines.Init();
                    // unitlines."LineNo1" := LineNo1;
                    // unitlines."Entry No." := Unit."CustNo.";
                    unitlines."Unit Code" := UnitM."Unit code";
                    unitlines."Unit Name" := UnitM."Unit Name";
                    // unitlines.IsCore := UnitM.IsCore;
                    // unitlines.Validate(IsCore);
                    unitlines.Insert()

                end;
            until UnitM.Next() = 0;
        end;

    end;
}