enum 50132 "ApprovalStatus"
{
    Extensible = true;
    AssignmentCompatibility = true;

    // value(0; "Created") { Caption = 'Created'; }
    value(0; "Open") { Caption = 'Open'; }
    value(1; "Canceled") { Caption = 'Canceled'; }
    value(2; "Rejected") { Caption = 'Rejected'; }
    value(3; "Approved") { Caption = 'Approved'; }
    value(4; "Pending Approval") { Caption = 'Pending Approval '; }
}