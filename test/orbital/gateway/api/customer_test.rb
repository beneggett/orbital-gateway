require "test_helper"
require 'customer_credit_cards'
include CustomerCreditCards

class Orbital::Gateway::Api::CustomerTest < Minitest::Test
  describe "customer tests" do

    let(:gateway) { Orbital::Gateway::Api::Customer.new }

    it 'tests created profile amex 5.1' do
      # skip "TODO Failing.  Need to look into why"
      result = Orbital::Gateway::Api::Customer.create_profile(amex_params)
      # amex_params.merge!({customer_profile_action: :create, order_default_amount: '0'})
      # body = gateway.xml_body(amex_params)
      # result = gateway.post(body)
      binding.pry
    end

    it 'tests created profile visa 5.1 H8' do
      # skip "successfully ran"
      body = gateway.xml_body(visa_params.merge({customer_profile_action: :create, order_default_amount: '0'}))
      result = gateway.post(body)
      binding.pry
    end
  
    it 'tests created profile discover 5.1 H3' do
      skip "successfully ran"
      discover_params.merge!({customer_profile_action: :create, order_default_amount: '0'})
      body = gateway.xml_body(discover_params)
      result = gateway.post(body)
      binding.pry
    end

    it 'tests created profile jcb 5.1 H5' do
      skip "successfully ran"
      jcb_params.merge!({customer_profile_action: :create, order_default_amount: '0'})
      body = gateway.xml_body(jcb_params)
      result = gateway.post(body)
      binding.pry
    end

    it 'tests created profile first mastercard 5.1 H6' do
      skip "successfully ran"
      first_master_card_params.merge!({customer_profile_action: :create, order_default_amount: '0'})
      body = gateway.xml_body(first_master_card_params)
      result = gateway.post(body)
      binding.pry
    end

    it 'tests created profile first mastercard 5.1 H7' do
      skip "successfully ran"
      second_master_card_params.merge!({customer_profile_action: :create, order_default_amount: '0'})
      body = gateway.xml_body(second_master_card_params)
      result = gateway.post(body)
      binding.pry
    end
    it 'tests created profile for another mastercard' do
      skip "successfully ran"
      tmp = second_master_card_params.merge({customer_profile_action: :create, order_default_amount: '0'})
      tmp[:credit_card_number] = '2720990000000007'
      body = gateway.xml_body(tmp)
      result = gateway.post(body)
      binding.pry
    end

    it 'updates the amex profile' do
      # skip "TODO Failing.  Need to look into why"
      amex_params.merge!({order_default_amount: '0'})
      profile = Orbital::Gateway::Api::Customer.create_profile(amex_params.merge({order_default_amount: 0}))
      assert profile.success?
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(amex_params.merge({order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      binding.pry
      assert profile.success?
    end

    it 'updates the visa profile' do
      profile = Orbital::Gateway::Api::Customer.create_profile(visa_params.merge({order_default_amount: '0'}))
      assert profile.success?
      binding.pry
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(visa_params.merge({order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      assert profile.success?
    end

    it 'updates the discover profile' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(discover_params.merge({order_default_amount: '0'}))
      assert profile.success?
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(discover_params.merge({order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      assert profile.success?
    end

    it 'updates the jcb profile' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(jcb_params.merge({order_default_amount: '0'}))
      assert profile.success?
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(jcb_params.merge({order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      assert profile.success?
    end

    it 'updates the mastercard with suite' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(first_master_card_params.merge({order_default_amount: '0'}))
      assert profile.success?
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(first_master_card_params.merge({order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      assert profile.success?
    end

    it 'updates the mastercard without suite' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: '0'}))
      assert profile.success?
      updated_profile = Orbital::Gateway::Api::Customer.update_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: 0, customer_ref_num: profile.customer_ref_num}))
      assert profile.success?
    end

    it 'deletes the mastercard without suite' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: '0'}))
      assert profile.success?
      deleted_profile = Orbital::Gateway::Api::Customer.delete_profile({customer_ref_num: profile.customer_ref_num})
      assert deleted_profile.success?
      binding.pry
    end

    it 'auth and captures negative' do
      skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: '0'}))
      gw = Orbital::Gateway::Api::Authorization.new
      assert profile.success?
      body = gw.auth_and_capture(order_visa_params.merge({amount: '30416', customer_ref_num: profile.customer_ref_num}))
      result = gw.post(body)
      binding.pry
    end

    it 'auth and captures failover' do
      # skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: '0'}))
      gw = Orbital::Gateway::Api::Authorization.new
      assert profile.success?
      body = gw.auth_and_capture(order_visa_params.merge({amount: '11000', customer_ref_num: profile.customer_ref_num}))
      result = gw.post(body)
      binding.pry
    end

    it 'retrieve the mastercard without suite' do
      # skip "successfully ran"
      profile = Orbital::Gateway::Api::Customer.create_profile(second_master_card_params.merge({credit_card_number: '2521000000000006', order_default_amount: '0'}))
      inquery = Orbital::Gateway::Api::Customer.retrieve_profile(customer_ref_num: profile.customer_ref_num)
      binding.pry
    end
  end
end
