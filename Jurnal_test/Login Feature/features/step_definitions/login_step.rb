require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given ("Open Jurnal Site") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When ("Entry valid Email and Password") do
    # Masukkan email
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    # Masukkan password
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
end
Then("Submit Form Login") do
    # Pilih button sign in
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    
    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to eq("https://sandbox-sso.mekari.com/") 
end
