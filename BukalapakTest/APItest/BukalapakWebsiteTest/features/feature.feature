@Bukalapak
  Feature: feature
    @Register
    Scenario:
      Given Open Bukalapak
      Then Go To Register Page
      Then Compare URL


    @LoginSuccess
    Scenario:
      Given Open Bukalapak
      Then  Go To Login Page
      Then Compare After Login