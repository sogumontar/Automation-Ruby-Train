require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Jurnal Site") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When("Login with email and password") do 
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click 
end

Then("I Input Unit Price") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    driver.find_element(:xpath,'//*[@id="transaction_transaction_lines_attributes_0_rate"]').send_keys '500000'

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
    sleep(5)
end