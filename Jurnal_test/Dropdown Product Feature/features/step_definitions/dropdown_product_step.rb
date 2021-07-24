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

Then("I Select dropdown existing product on the list") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_transaction_transaction_lines_attributes_0_product_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'Penjualan' }

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
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

Then("I Select dropdown customer with add new product") do
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    driver.find_element(:xpath,'//*[@id="tab-1"]/div[2]/div/div[2]/a[1]').click
    
    driver.find_element(:xpath,'//*[@id="s2id_transaction_transaction_lines_attributes_0_product_id"]/a/span[2]/b').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)
end

Then("I Enter valid data in require fields") do
    driver.find_element(:xpath,'//*[@id="product_name"]').send_keys 'Indah Trivena'
    driver.find_element(:xpath,'//*[@id="product_product_code"]').send_keys 'PR-0001'
    sleep(1)

    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[9]/div[2]/div[2]/form/div[2]/div[2]/div[2]/div[1]/div/a/span[2]/b').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)

    driver.find_element(:xpath,'//*[@id="product_unit_name"]').send_keys 'Foody' 
    sleep(2)
    driver.find_element(:xpath,'//*[@id="add-new-product-unit"]').click
    sleep(2)
    # dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_unit_id"]/a/span[2]')
    # option = dropdown.find_elements(tag_name: 'option')
    # option.each { |option| option.click if option.text == 'Buah' }

    driver.find_element(:xpath,'//*[@id="s2id_product_product_category_ids"]/ul').send_keys 'Food'
    driver.find_element(:xpath,'//*[@id="product_buy_price_per_unit"]').send_keys '500000'  
    
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_buy_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(5-50000) - Beban Pokok Pendapatan (Cost of Sales)' }

    driver.find_element(:xpath,'//*[@id="product_sell_price_per_unit"]').send_keys '500000'

    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(4-40000) - Pendapatan Jasa (Income)' }

    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_tax_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'PPN' }
end

Then("I Submit form new customer") do
    driver.find_element(:xpath,'//*[@id="add-new-product"]').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end