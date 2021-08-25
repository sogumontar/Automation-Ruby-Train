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

    @SearchSuccess
    Scenario:
      Given Open Bukalapak
      Then Go To Login Page
      Then Input True Password
      Then Go To Search
      Then Compare After Search

    @AddToCartSuccess
    Scenario:
      Given Open Bukalapak
      Then Go To Login Page
      Then Input True Password
      Then Go To Search
      Then I Add To Cart
      Then Compare After Cart