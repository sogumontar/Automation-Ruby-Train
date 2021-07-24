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

Then("I Select dropdown existing customer on the list") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'indah (Pelanggan)' }

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
    sleep(5)
end

Given ("I Open Jurnal Site") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When("I Login with email and password") do 
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click 
end

Then("I Select dropdown customer with add new customer") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(5)
end

Then("I Enter valid data in require fields") do
    driver.find_element(:xpath,'//*[@id="person_display_name"]').send_keys 'Indah Trivena'
    driver.find_element(:xpath,'//*[@id="person_email"]').send_keys 'indahtrivena359@gmail.com'
    driver.find_element(:xpath,'//*[@id="person_billing_address"]').send_keys 'Tarutung'
    driver.find_element(:xpath,'//*[@id="person_phone"]').send_keys '0895346050317'            
    sleep(5)
end

Then("I Submit form new customer") do
    driver.find_element(:xpath,'//*[@id="aodc-add"]').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end