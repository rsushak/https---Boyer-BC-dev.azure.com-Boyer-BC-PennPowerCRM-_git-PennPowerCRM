codeunit 50100 "BOY-COD Event Subscribers"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetCustomerAccountMapping', '', true, true)]
    local procedure OnAfterResetCustomerAccountMapping(IntegrationTableMappingName: Code[20])
    var
        CDSCustomer: Record "CRM Account";
        Customer: Record Customer;
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(
            IntegrationTableMappingName,
            Customer.FieldNo("No."),
            CDSCustomer.FieldNo(AccountNumber),
            IntegrationFieldMapping.Direction::Bidirectional,
            '', true, false);

        Customer.CalcFields(Balance);

        IntegrationFieldMapping.CreateRecord(
        IntegrationTableMappingName,
        Customer.FieldNo("Balance"),
        CDSCustomer.FieldNo(outstandingbalance),
        IntegrationFieldMapping.Direction::Bidirectional,
        '', true, false);
    end;

    var
        myInt: Integer;
}