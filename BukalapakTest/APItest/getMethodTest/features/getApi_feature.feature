@Api
Feature: Open Amazon Site
  @GetApi
  Scenario:
    Given Access URI
    Then Compare

  @PostApi
  Scenario:
    Given Access post URI
    Then  Compare result
