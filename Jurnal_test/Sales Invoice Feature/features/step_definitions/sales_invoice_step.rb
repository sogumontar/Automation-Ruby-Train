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

Then("I Select dropdown existing customer on the list") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    # Pilih customer
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'indah (Pelanggan)' }

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end

Given ("I Open Jurnal Site") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When("I Login with email and password") do 
    # Masukkan email
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    # Masukkan password
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    # Pilih button sign in
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    # Pilih button jurnal
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click 
end

Then("I Select dropdown customer with add new customer") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b').click
end

Then ("click dropdown") do
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
end

Then("I Enter valid data in require fields") do
    # Masukkan nama customer
    driver.find_element(:xpath,'//*[@id="person_display_name"]').send_keys 'Indah Trivena'
    # Masukkan email customer
    driver.find_element(:xpath,'//*[@id="person_email"]').send_keys 'indahtrivena359@gmail.com'
    # Masukkan alamat customer
    driver.find_element(:xpath,'//*[@id="person_billing_address"]').send_keys 'Tarutung'
    # Masukkan nomor telepon customer
    driver.find_element(:xpath,'//*[@id="person_phone"]').send_keys '0895346050317'
end

Then("I Submit form new customer") do
    driver.find_element(:xpath,'//*[@id="aodc-add"]').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end