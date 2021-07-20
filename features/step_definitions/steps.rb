require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox

Given (/^I Open the youtube homepage$/) do
driver.navigate.to "https://youtube.com/"
end
