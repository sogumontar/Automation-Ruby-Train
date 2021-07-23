@SalesInvoiceJurnal
Feature: Open Jurnal Site
    @SalesInvoiceDropdown
    Scenario:
        Given Open Jurnal Site
        When Login with email and password
        Then I Select dropdown existing customer on the list

    @SalesInvoiceCreateCustomer
    Scenario:
        Given I Open Jurnal Site
        When I Login with email and password
        Then I Select dropdown customer with add new customer
        Then I Enter valid data in require fields
        Then I Submit form new customer
