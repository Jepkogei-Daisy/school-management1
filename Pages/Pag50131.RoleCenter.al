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

            }
            group(Section1)
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

                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Grading System';
                    //     RunObject = page "Student Grade";

                    // }

                    // }
                    // group(Section2)
                    // {
                    //     Caption = 'APPLICANTS';
                    //     action(lists)
                    //     {
                    //         RunObject = page "StudentApplicationList";
                    //         ApplicationArea = Basic, Suite;
                    //         Caption = 'Applicants List';

                    //     }

                    // }
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
