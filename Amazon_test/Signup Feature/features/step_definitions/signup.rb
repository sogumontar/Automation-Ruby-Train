require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Amazon Site") do
    driver.navigate.to "https://amazon.com/"
end

Then("Open Register Page") do 
    driver.find_element(:xpath,'//*[@id="nav-link-accountList"]/span').click
    driver.find_element(:xpath,'//*[@id="createAccountSubmit"]').click
end

Then("Enter valid data in require fields") do
    driver.find_element(:xpath,'//*[@id="ap_customer_name"]').send_keys 'Indah Trivena Tampubolon'
    driver.find_element(:xpath,'//*[@id="ap_email"]').send_keys 'indahtrivena124@gmail.com'
    driver.find_element(:xpath,'//*[@id="ap_password"]').send_keys 'indahtriv008'
    driver.find_element(:xpath,'//*[@id="ap_password_check"]').send_keys 'indahtriv008'
    sleep(5)
end

Then("Submit form register") do
    driver.find_element(:xpath,'//*[@id="continue"]').click

    urlNya = driver.current_url
    puts urlNya
    # expect(urlNya).to eq("https://www.amazon.com/ap/cvf/request?arb=834abbfa-79d0-4455-86fc-87171b318e30")
    expect(urlNya).to match(/request?arb/)
end