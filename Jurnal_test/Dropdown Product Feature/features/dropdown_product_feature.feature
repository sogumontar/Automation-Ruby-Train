@DropDownProductJurnal
Feature: Open Jurnal Site
    @ExistingProduct
    Scenario:
        Given Open Jurnal Site
        When Login with email and password
        Then I Select dropdown existing product on the list

    @AddNewProduct
    Scenario:
        Given I Open Jurnal Site
        When I Login with email and password
        Then I Select dropdown customer with add new product
        Then I Enter valid data in require fields
        Then I Submit form new product

    @SelectingOtherBuyAccount
    Scenario:
        Given I Open Jurnal Page
        When I Login with valid email and password
        Then I Select dropdown customer with add new product with selecting  other buy account
        Then Enter valid data in require fields
        Then Submit form new product
