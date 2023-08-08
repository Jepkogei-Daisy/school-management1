codeunit 50140 "Populate Units"

{
    procedure SuggestLines()
    var
        UnitM: Record "Unit Matrix";
        Unitlines: Record "Units Lines";
        LineNo1: Integer;
        Units: Record "Units Registration Form";
    begin
        UnitM.Reset();
        UnitM.SetRange("Semester Name", Units."Semester Name");
        UnitM.SetRange("Academic Year", Units."Academic Year");
        if UnitM.FindSet() then begin
            repeat
                LineNo1 := LineNo1 + 1000;
                //Unitlines.Reset();
                unitlines.Init();
                Unitlines.LineNo1 := LineNo1;
                //Unitlines."Entry No." := UnitM."Registration Code";
                unitlines."Unit Code" := UnitM."Unit code";
                unitlines."Unit Name" := UnitM."Unit Name";
                Unitlines."Core Unit" := UnitM."Core Unit";
                unitlines.Insert();
            until UnitM.Next() = 0;
        end;

    end;
}