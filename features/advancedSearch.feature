@AdvancedSearch
Feature: Google Advanced Search

@MainMenu
Scenario: Verify advanced search page
Given open google advanced search
Then input title, languange, and time
Then validate result advanced search