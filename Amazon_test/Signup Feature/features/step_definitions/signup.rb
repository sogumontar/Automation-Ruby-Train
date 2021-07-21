require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Amazon Site") do
    driver.navigate.to "https://amazon.com/"
end

Then("Open Login Page") do
    driver.find_element(:xpath,'//*[@id="nav-link-accountList"]/span').click
    driver.find_element(:xpath,'//*[@id="auth-create-account-link"]/span').click
    sleep(5)
end
