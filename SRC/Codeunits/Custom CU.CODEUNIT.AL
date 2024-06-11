codeunit 50137 "Custom CU"
{
    // Register the new upgrade tag for new companies when they are created.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(GetCustomSetupTag());
    end;

    // Use methods to avoid hard-coding the tags. It is easy to remove afterwards because it's compiler-driven.
    procedure GetCustomSetupTag(): Text
    begin
        exit('SV-1.0.0.4-CustomSetup-20240610');
    end;


    procedure GetCustomSetupTag2(): Text
    begin
        exit('SV-1.0.0.5-CustomSetup-20240611');
    end;
}
