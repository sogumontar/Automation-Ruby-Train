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

Then("I Select transaction date by inputting date") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    driver.find_element(:xpath,'//*[@id="transaction_transaction_date"]').send_keys '23/07/2021'
    driver.find_element(:xpath,'//*[@id="transaction_due_date"]').send_keys '24/07/2021'

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

Then("I Select transaction date by selection date modal") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    driver.find_element(:xpath,'//*[@id="main_form"]/div[3]/div[2]/div/div[1]/div/span').click
    
    while (true)
        String text=driver.find_element(:xpath,'//*[@id="modj"]/div[36]/div[1]/table/thead/tr[2]/th[2]').getText

        if(text.eq(month))
            break
        else
            driver.find_element(:xpath,'//*[@id="modj"]/div[36]/div[1]/table/thead/tr[2]/th[3]').click
        end
    end

    driver.find_element(:xpath,'//*[@id="modj"]/div[36]/div[1]/table/thead/tr[2]/th[3]').click

    driver.find_element(:xpath,'//*[@id="modj"]/div[36]/div[1]/table/thead/tr[2]/th[2]').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="due_date"]/div/span').click
    driver.find_element(:xpath,'//*[@id="modj"]/div[36]/div[1]/table/tbody/tr[5]/td[2]').click
    sleep(5)

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end