require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Amazon Site") do
    driver.navigate.to "https://amazon.com/"
end

Then("Open Login Page") do
    driver.find_element(:xpath,'//*[@id="nav-link-accountList"]/span').click
    sleep(1)
end

When ("Entry valid Email and Password") do
    driver.find_element(:xpath,'//*[@id="ap_email"]').send_keys 'hendrasimz92@gmail.com'
end
Then ("Entry Email and Password")do
    driver.find_element(:xpath, '//*[@id="continue"]').click
    driver.find_element(:xpath,'//*[@id="ap_password"]').send_keys 'Simangunsong77!'
end
Then("Submit Form Login") do
    driver.find_element(:xpath, '//*[@id="signInSubmit"]').click
    
    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).not_to eq("https://www.amazon.com/?ref_=nav_ya_signin&")
    
end
