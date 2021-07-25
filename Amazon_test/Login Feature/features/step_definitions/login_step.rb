require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Amazon Site") do
    driver.navigate.to "https://amazon.com/"
    driver.find_element(:xpath,'//*[@id="nav-link-accountList"]/span').click
end

When ("Entry valid Email and Password") do
    driver.find_element(:xpath,'//*[@id="ap_email"]').send_keys 'hendrasimz92@gmail.com'
    driver.find_element(:xpath, '//*[@id="continue"]').click
    driver.find_element(:xpath,'//*[@id="ap_password"]').send_keys 'Simangunsong77!'
end

Then("Submit Form Login") do
    driver.find_element(:xpath, '//*[@id="signInSubmit"]').click
    
    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to eq("https://www.amazon.com/ap/signin")
end

Given ("I Open Amazon Site") do
    driver.navigate.to "https://amazon.com/"
    driver.find_element(:xpath,'//*[@id="nav-link-accountList"]/span').click
end

When ("Entry valid Email and invalid Password") do
    driver.find_element(:xpath,'//*[@id="ap_email"]').send_keys 'hendrasimz92@gmail.com'
    driver.find_element(:xpath, '//*[@id="continue"]').click
    driver.find_element(:xpath,'//*[@id="ap_password"]').send_keys 'Simangunsong'
end
Then("I Submit Form Login") do
    driver.find_element(:xpath, '//*[@id="signInSubmit"]').click
    
    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to eq("https://www.amazon.com/ap/signin")
    
end
