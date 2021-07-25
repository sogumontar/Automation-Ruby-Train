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

Then("I Upload Picture") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    # Upload gambar
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[4]/section/div/div/form/div[7]/div[2]/div/div[3]/div[3]/div[1]/span').click
    # Isi transaction due date
    driver.find_element(:xpath,'//*[@id="transaction_due_date"]').send_keys '24/07/2021'

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end
