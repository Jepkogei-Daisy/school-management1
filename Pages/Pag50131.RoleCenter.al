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
                    // RunObject = page"
                    ApplicationArea = Basic, Suite;
                    // Caption =
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
                action(UnitMatrix)
                {
                    RunObject = page "UnitMatrix";
                    ApplicationArea = Basic, Suite;
                    Caption = 'Unit Matrix';
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
