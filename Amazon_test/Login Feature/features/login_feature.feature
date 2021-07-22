@AdvancedSearch
Feature: Open Amazon Site
    @MainMenu
    Scenario:
        Given Open Amazon Site
        When Open Login Page
        Then Entry valid Email and Password
        Then Submit Form Login

    @LoginFailed
    Scenario:
        Given Open Amazon Site
        When I Open Login Page
        Then Entry valid Email and invalid Password
        Then I Submit Form Login
