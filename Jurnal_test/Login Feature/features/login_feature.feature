@LoginJurnal
Feature: Open Jurnal Site
    @LoginSuccess
    Scenario:
        Given Open Jurnal Site
        When Entry valid Email and Password
        Then Submit Form Login
