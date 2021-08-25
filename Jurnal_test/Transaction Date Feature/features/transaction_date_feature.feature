@TransactionDateJurnal
Feature: Open Jurnal Site
    @InputtingTransactionDate
    Scenario:
        Given Open Jurnal Site
        When Login with email and password
        Then I Select transaction date by inputting date

    @SelectionTransactionDate
    Scenario:
        Given I Open Jurnal Site
        When I Login with email and password
        Then I Select transaction date by selection date modal
