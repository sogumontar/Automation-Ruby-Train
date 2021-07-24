require 'selenium-webdriver'

driver = Selenium::WebDriver.for:chrome

Given ("Open Data Collector") do
    driver.navigate.to "http://data-collector-fe.herokuapp.com/"
end

When ("Entry Number") do
    driver.find_element(:xpath,'//*[@id="__BVID__13"]').send_keys("085820522062");
end
Then ("Click Search")do
    driver.find_element(:xpath,'//*[@id="nav-collapse"]/ul/div/li/form/div/div[2]/button').click
    sleep(5)
end
