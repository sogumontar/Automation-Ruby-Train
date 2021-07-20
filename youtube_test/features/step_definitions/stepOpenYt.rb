require 'selenium-webdriver'

driver = Selenium::WebDriver.for:chrome   

Given("I Open the youtube homepage") do
  driver.navigate.to "https://youtube.com/"         # direct to site
end
