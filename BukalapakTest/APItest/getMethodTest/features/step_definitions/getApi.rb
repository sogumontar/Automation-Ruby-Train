require 'uri'
require 'net/http'

expectedOutput = [Integer, Integer, String, String]
actualOutput = []
Given("Access URI") do
  uri = URI("https://jsonplaceholder.cypress.io/posts")
  res = Net::HTTP.get_response(uri)
  data = JSON.parse(res.body)

  actualOutput.push(data[0]['userId'].class)
  actualOutput.push(data[0]['id'].class)
  actualOutput.push(data[0]['title'].class)
  actualOutput.push(data[0]['body'].class)
end

Then("Compare") do
  expect(actualOutput).to eq(expectedOutput)
end
