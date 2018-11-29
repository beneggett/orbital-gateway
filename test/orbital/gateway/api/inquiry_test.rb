require "test_helper"
require 'order_credit_cards'
include OrderCreditCards

class Orbital::Gateway::Api::CustomerTest < Minitest::Test
  describe "inquiry tests" do
    it 'finds the inquiry' do
      skpi
      retry_trace = rand(99999999999999)
      result = Orbital::Gateway::Api::Authorization.auth_and_capture(discover_params.merge({amount: '1000'}), retry_trace)
      inquiry_response = Orbital::Gateway::Api::Inquiry.find_request(retry_trace)
    end
  end
end

