@SignUpAmazon
Feature: Open Amazone site

    @SignUpSuccess
    Scenario: 
        Given Open Amazon Site
        When Open Register Page
        Then Enter valid data in require fields
        Then Submit form register
    
    @SignUpFailed
    Scenario: 
        Given I Open Amazon Site
        When I Open Register Page
        Then I Enter invalid password in require fields
        Then I Submit form register