codeunit 50136 UpgradeCU
{
    // 1. Debug without publishing (use attach config)
    // 2. Publish without debugging
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        // Run upgrade code
        UpgradeCustomSetup();
        UpgradeCustomSetupAgain();
    end;

    local procedure UpgradeCustomSetup()
    var
        CustomSetup: Record "Custom Setup";
        ModuleInfo: ModuleInfo;
        CustomCU: Codeunit "Custom CU";
        UpgradeTagMgt: Codeunit "Upgrade Tag";
    begin
        // Check whether the tag has been used before, and if so, don't run upgrade code
        if UpgradeTagMgt.HasUpgradeTag(CustomCU.GetCustomSetupTag()) then
            exit;

        if not NavApp.GetCurrentModuleInfo(ModuleInfo) then
            Clear(ModuleInfo);

        case true of
            ModuleInfo.DataVersion() = Version.Create(1, 0, 0, 4):
                begin
                    if CustomSetup.FindFirst() then begin
                        CustomSetup."Default URL" := 'https://www.google.ca';
                        CustomSetup."No. of Retries" := 300;
                        CustomSetup."Type of app" := CustomSetup."Type of app"::"-NA";
                        CustomSetup.Modify();
                    end;
                end;
            ModuleInfo.DataVersion() = Version.Create(1, 0, 0, 5):
                begin
                    if CustomSetup.FindFirst() then begin
                        CustomSetup."Default URL" := 'https://www.google.jp';
                        CustomSetup."No. of Retries" := 300;
                        CustomSetup."Type of app" := CustomSetup."Type of app"::"Ruby on Rails";
                        CustomSetup.Modify();
                    end;
                end;
        end;

        // Insert the upgrade tag in table 9999 "Upgrade Tags" for future reference
        UpgradeTagMgt.SetUpgradeTag(CustomCU.GetCustomSetupTag());
    end;

    local procedure UpgradeCustomSetupAgain()
    var
        CustomSetup: Record "Custom Setup";
        ModuleInfo: ModuleInfo;
        CustomCU: Codeunit "Custom CU";
        UpgradeTagMgt: Codeunit "Upgrade Tag";
    begin
        // Check whether the tag has been used before, and if so, don't run upgrade code
        if UpgradeTagMgt.HasUpgradeTag(CustomCU.GetCustomSetupTag2()) then
            exit;

        if not NavApp.GetCurrentModuleInfo(ModuleInfo) then
            Clear(ModuleInfo);

        case true of
            ModuleInfo.DataVersion() = Version.Create(1, 0, 0, 4):
                begin
                    if CustomSetup.FindFirst() then begin
                        CustomSetup."Default URL" := 'https://www.google.ca';
                        CustomSetup."No. of Retries" := 300;
                        CustomSetup."Type of app" := CustomSetup."Type of app"::"-NA";
                        CustomSetup.Modify();
                    end;
                end;
            ModuleInfo.DataVersion() = Version.Create(1, 0, 0, 5):
                begin
                    if CustomSetup.FindFirst() then begin
                        CustomSetup."Default URL" := 'https://www.google.se';
                        CustomSetup."No. of Retries" := 100;
                        CustomSetup."Type of app" := CustomSetup."Type of app"::"-NA";
                        CustomSetup.Modify();
                    end;
                end;
        end;
        // Insert the upgrade tag in table 9999 "Upgrade Tags" for future reference
        UpgradeTagMgt.SetUpgradeTag(CustomCU.GetCustomSetupTag2());
    end;
}