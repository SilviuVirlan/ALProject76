table 50135 "Custom Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[1])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "No. of Retries"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Default URL"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Type of app"; enum "App Type")
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }
}