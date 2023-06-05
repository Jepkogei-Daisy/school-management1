page 50146 "Level of Application"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable =LevelOfApplication;
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Level Code";Rec."Level Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the level code in the field';
                    
                }
                field("Level Name";Rec."Level Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the level name in the field';
                }
            }
        }
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
}