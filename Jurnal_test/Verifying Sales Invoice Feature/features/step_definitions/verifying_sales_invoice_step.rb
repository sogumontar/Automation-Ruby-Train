require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Jurnal Site") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When("Login with email and password") do 
    # Masukkan email
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    # Masukkan password
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    # Pilih button sign in
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    # Pilih button jurnal
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click 
end

Then("I open sales invoice") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih number sales invoice
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[6]/section/div[2]/div/div[2]/div[2]/div/div[1]/div[1]/div[2]/table/tbody/tr/td[3]/a').click 
end

Then("I Verifying Sales Invoice") do
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[4]/section/div[6]/div/div[2]/div[2]/button[1]').click
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[4]/section/div[6]/div/div[2]/div[2]/ul/li[3]/a').click
    sleep(2)
end

Then("I create payment") do
    driver.find_element(:xpath,'//*[@id="transaction_due_date"]').send_keys '01/08/2021'
    driver.find_element(:xpath,'//*[@id="transaction_memo"]').send_keys 'thankyou'
end

Then("I Submit form create payment") do
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[4]/section/div/div/form/div[10]/div/button').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to match(/receive_payments/)
end