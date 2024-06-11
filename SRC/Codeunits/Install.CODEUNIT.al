codeunit 50135 InstallCU
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        ModuleInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ModuleInfo);
        if ModuleInfo.DataVersion() = Version.Create(0, 0, 0, 0) then //new installation
            InstallPerCompany()
        else
            //reinstallation
            case true of
                ModuleInfo.DataVersion() = Version.Create(1, 0, 0, 6):
                    //add reinstallation code for each version
                    ReInstallPerCompany();
            end;
    end;

    trigger OnInstallAppPerDatabase()
    var
    begin
    end;

    local procedure InstallPerCompany()
    var
        CustomSetup: Record "Custom Setup";
    begin
        CustomSetup.PK := '';
        CustomSetup."Default URL" := 'https://www.google.com';
        CustomSetup."No. of Retries" := 300;
        CustomSetup."Type of app" := CustomSetup."Type of app"::"ASP.NET MVC";
        CustomSetup.Insert();
    end;

    local procedure ReInstallPerCompany()
    var
        CustomSetup: Record "Custom Setup";
    begin
        CustomSetup.Init();
        CustomSetup.PK := '';
        CustomSetup."Default URL" := 'https://www.google.com';
        CustomSetup."No. of Retries" := 300;
        CustomSetup."Type of app" := CustomSetup."Type of app"::"ASP.NET MVC";
        if not CustomSetup.Insert() then
            CustomSetup.Modify();
    end;
}