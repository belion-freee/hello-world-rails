require "webmock/rspec"

module MockHelper
  include WebMock::API

  # WebMock.allow_net_connect!
  WebMock.enable!

  class << self
    def mock_request(key, body, status = 200)
      json = status == 200 ? body.to_json : { errors: body }.to_json
      WebMock.stub_request(:any, /#{key}/).to_return(
        body:    json,
        status:  status,
        headers: { "Content-Type" => "application/json" }
      )
    end
  end
end
