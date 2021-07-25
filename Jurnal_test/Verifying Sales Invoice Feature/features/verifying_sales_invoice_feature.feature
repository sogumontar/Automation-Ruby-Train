@VerifyingSalesInvoiceJurnal
Feature: Open Jurnal Site
    @VerifyingSalesInvoice
    Scenario:
        Given Open Jurnal Site
        When Login with email and password
        Then I open sales invoice
        Then I Verifying Sales Invoice
        Then I create payment
        Then I Submit form create payment
