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
      Then  Input True Password
      Then Compare After Login

    @LoginFailed
    Scenario:
      Given Open Bukalapak
      Then Go To Login Page
      Then Input Wrong Password
      Then Compare Failed Login