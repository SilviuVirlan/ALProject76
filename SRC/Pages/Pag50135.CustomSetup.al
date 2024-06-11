page 50135 "Custom Setup"
{
    ApplicationArea = All;
    Caption = 'Custom Setup';
    PageType = List;
    SourceTable = "Custom Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Default URL"; Rec."Default URL")
                {
                    ToolTip = 'Specifies the value of the Default URL field.', Comment = '%';
                }
                field("No. of Retries"; Rec."No. of Retries")
                {
                    ToolTip = 'Specifies the value of the No. of Retries field.', Comment = '%';
                }
                field("Type of app"; Rec."Type of app")
                {
                    ToolTip = 'Specifies the value of the Type of app field.', Comment = '%';
                }
            }
        }
    }
}
