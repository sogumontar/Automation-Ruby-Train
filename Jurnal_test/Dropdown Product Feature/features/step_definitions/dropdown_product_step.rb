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

Then("I Select dropdown existing product on the list") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    # Pilih product
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
    # Masukkan email
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    # Masukkan password
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    # Pilih button sign in
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    # Pilih button jurnal
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click
end

Then("I Select dropdown customer with add new product") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    # Pilih dropdown customer
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b')
    option = dropdown.find_elements(tag_name: 'option')
    # Pilih customer 
    option.each { |option| option.click if option.text == 'indah (Pelanggan)' }
    # Pilih dropdown product
    driver.find_element(:xpath,'//*[@id="s2id_transaction_transaction_lines_attributes_0_product_id"]/a/span[2]/b').click
    sleep(1)
    # Pilih tambah produk
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)
end

Then("I Enter valid data in require fields") do
    # Isi field name
    driver.find_element(:xpath,'//*[@id="product_name"]').send_keys 'Indah Trivena'
    # Isi field product code
    driver.find_element(:xpath,'//*[@id="product_product_code"]').send_keys 'PR-0001'
    # Field unit
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[9]/div[2]/div[2]/form/div[2]/div[2]/div[2]/div[1]/div/a/span[2]/b').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)
    driver.find_element(:xpath,'//*[@id="product_unit_name"]').send_keys 'Drink' 
    sleep(2)
    driver.find_element(:xpath,'//*[@id="add-new-product-unit"]').click
    sleep(2)
    # Isi field Buy Unit Price 
    driver.find_element(:xpath,'//*[@id="product_buy_price_per_unit"]').send_keys '500000'  
    # Pilih buy account
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_buy_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(5-50000) - Beban Pokok Pendapatan (Cost of Sales)' }
    # Isi field sale unit price 
    driver.find_element(:xpath,'//*[@id="product_sell_price_per_unit"]').send_keys '500000'
    # Pilih sales account
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(4-40000) - Pendapatan Jasa (Income)' }
    # Pilih tax
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_tax_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'PPN' }
end

Then("I Submit form new product") do
    driver.find_element(:xpath,'//*[@id="add-new-product"]').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end

Given ("I Open Jurnal Page") do
    driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in"
end

When("I Login with valid email and password") do 
    # Masukkan email
    driver.find_element(:xpath,'//*[@id="user_email"]').send_keys 'indahtrivena124@gmail.com'
    # Masukkan password
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys 'indahtriv008'
    # Pilih button sign in
    driver.find_element(:xpath, '//*[@id="new-signin-button"]').click
    # Pilih button jurnal
    driver.find_element(:xpath, '//*[@id="btn-jurnal"]').click
end

Then("I Select dropdown customer with add new product with selecting  other buy account") do
    # Pilih menu sales
    driver.find_element(:xpath,'//*[@id="vnav-sales-link"]/span').click
    # Pilih button sales
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/nav/div[1]/ul/li[1]/a').click
    # Pilih dropdown customer
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_transaction_person_id"]/a/span[2]/b')
    option = dropdown.find_elements(tag_name: 'option')
    # Pilih customer 
    option.each { |option| option.click if option.text == 'indah (Pelanggan)' }
    # Pilih dropdown product
    driver.find_element(:xpath,'//*[@id="s2id_transaction_transaction_lines_attributes_0_product_id"]/a/span[2]/b').click
    sleep(1)
    # Pilih tambah produk
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)
end

Then("Enter valid data in require fields") do
    # Isi field name
    driver.find_element(:xpath,'//*[@id="product_name"]').send_keys 'Indah Trivena'
    # Isi field product code
    driver.find_element(:xpath,'//*[@id="product_product_code"]').send_keys 'PR-0001'
    # Field unit
    driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[9]/div[2]/div[2]/form/div[2]/div[2]/div[2]/div[1]/div/a/span[2]/b').click
    sleep(1)
    driver.find_element(:xpath,'//*[@id="select2-result-label-0"]').click
    sleep(2)
    driver.find_element(:xpath,'//*[@id="product_unit_name"]').send_keys 'Drinks' 
    sleep(2)
    driver.find_element(:xpath,'//*[@id="add-new-product-unit"]').click
    sleep(2)
    # Isi field Buy Unit Price 
    driver.find_element(:xpath,'//*[@id="product_buy_price_per_unit"]').send_keys '500000'  
    # Pilih buy account
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_buy_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(5-50000) - Beban Pokok Pendapatan (Cost of Sales)' }
    # Isi field sale unit price 
    driver.find_element(:xpath,'//*[@id="product_sell_price_per_unit"]').send_keys '500000'
    # Pilih sales account
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_account_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(4-40000) - Pendapatan Jasa (Income)' }
    # Pilih tax
    dropdown = driver.find_element(:xpath,'//*[@id="s2id_product_sell_tax_id"]/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == 'PPN' }
    # Checkbox  I Track Stock for This Item 
    driver.find_element(:xpath,'//*[@id="product_track_inventory"]').click
    # Isi field Minimum Stock Quantity
    driver.find_element(:xpath,'//*[@id="product_buffer_quantity"]').send_keys '500'
    # Pilih Default Inventory Account 
    dropdown = driver.find_element(:xpath,'/html/body/div[2]/div[4]/div[9]/div[2]/div[2]/form/div[2]/div[8]/div[2]/div[2]/div/a/span[2]')
    option = dropdown.find_elements(tag_name: 'option')
    option.each { |option| option.click if option.text == '(1-10200) - Persediaan Barang (Inventory)' }
end

Then("Submit form new product") do
    driver.find_element(:xpath,'//*[@id="add-new-product"]').click

    urlNya = driver.current_url
    puts urlNya
    expect(urlNya).to include("https://sandbox.jurnal.id/invoices/new")
end