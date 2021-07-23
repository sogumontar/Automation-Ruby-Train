@LoginAmazon
Feature: Open Amazon Site
    @LoginSuccess
    Scenario:
        Given Open Amazon Site
        When Entry valid Email and Password
        Then Submit Form Login

    @LoginFailed
    Scenario:
        Given I Open Amazon Site
        When Entry valid Email and invalid Password
        Then I Submit Form Login
