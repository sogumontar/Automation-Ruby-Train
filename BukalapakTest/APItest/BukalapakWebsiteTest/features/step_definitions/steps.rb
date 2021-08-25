require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for :chrome
link = "https://www.bukalapak.com/"
email = "test@gmail.com"
Given("Open Bukalapak") do
  driver.navigate.to link
end

Then("Go To Register Page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[1]').click

  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[1]/div[1]/div/input').send_keys email
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[2]/button').click
  sleep(5)
  driver.find_element(:xpath, '//*[@id="TFAJS-1629884816598"]/section/div/div[2]/div/div[2]/div/div/div/div/button[1]').click
  sleep(5)
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[6]/div[2]/div/a').click
end
Then("Compare URL") do
  urlNya = driver.current_url
  puts urlNya
  expect(urlNya).to eq("https://accounts.bukalapak.com/login?comeback=https%3A%2F%2Fwww.bukalapak.com%2F")
end

