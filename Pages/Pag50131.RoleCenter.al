page 50131 "Student Role Center"
{
    Caption = 'RoleCenter';
    PageType = RoleCenter;


    layout
    {
        area(RoleCenter)
        {
            group(group1)
            {
                part(headline; "Headline RC Administrator")
                {
                    ApplicationArea = Basic, suite;
                }
            }
        }


    }
    actions
    {
        area(Sections)
        {
            group(Section)
            {
                Caption = 'APPLICATION';
                action(Application)
                {
                    RunObject = page "StudentApplicationList";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Application List';
                }
                action(Courses)
                {
                    RunObject = page "courses";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Courses';
                }

            }
            group(Section1)
            {
                Caption = 'FINANCE';
                action(Finance)
                {
                    RunObject = page "Fee Structure List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Fee Structure';
                }
                action(Finance1)
                {
                    RunObject = page "Students Invoices";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Students Invoice List';
                }
                action(Finance2)
                {
                    RunObject = page "Student Receipt List";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Student Receipt List';
                }
            }
            group(Section2)
            {
                Caption = 'ACADEMICS';
                action(Academics)
                {
                    RunObject = page "Students in Session";
                    Image = Customer;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Students in Session';
                }
                action(Units)
                {
                    RunObject = page Units;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Units';
                }
                action(UnitMatrix)
                {
                    RunObject = page "UnitMatrix";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Unit Matrix';
                }
                action(UnitsRegistration)
                {
                    Runobject = page "Units Registration Form";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Units Registration Form';
                }

            }

            group(Section3)
            {

                Caption = 'ADMINISTRATION';

                action(Admin)
                {
                    RunObject = page "StudentMgntSetup";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Management Setup';
                }
                action(Admin1)
                {
                    RunObject = report "Students Report";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Students Report';
                }
                action(Admin2)
                {
                    RunObject = report "Fee Structure Report";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Fee Structure Report';
                }
            }

        }
    }
}






profile Student
{
    ProfileDescription = 'Student';
    RoleCenter = "Student Role Center";
    Caption = 'Student Management System';
}
