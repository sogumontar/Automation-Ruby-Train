require 'uri'
require 'net/http'

expectedOutput = ['recomendation', 'motorcycle', 12]
actualOutput = []

Given("Access post URI") do
  uri = URI('https://jsonplaceholder.cypress.io/posts')
  res = Net::HTTP.post_form(uri, 'title'=>'recomendation', 'body'=>'motorcycle', 'userId'=>12)
  data = JSON.parse(res.body)

  actualOutput.push(data['title'])
  actualOutput.push(data['body'])
  actualOutput.push(data['userId'])
end

Then("Compare result") do
  expect(actualOutput).to eq(expectedOutput)
end