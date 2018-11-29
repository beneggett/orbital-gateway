require "test_helper"
require 'order_credit_cards'
include OrderCreditCards

class Orbital::Gateway::Api::AuthorizationTest < Minitest::Test
  describe "Auth only tests" do

    let(:gateway) { Orbital::Gateway::Api::Authorization.new }

    it 'tests created profile amex 5.1' do
      body = gateway.auth_only(amex_params.merge({amount: '1'}))
      result = gateway.post(body)
    end

    it 'tests created profile visa 5.1 A8' do
      skip "successfully ran"
      body = gateway.auth_only(visa_params.merge({amount: '0'}))
      result = gateway.post(body)
    end
  
    it 'tests created profile discover 5.1 A3' do
      skip "successfully ran"
      body = gateway.auth_only(discover_params.merge({amount: '1'}))
      result = gateway.post(body)
    end

    it 'tests created profile jcb 5.1 A5' do
      skip "successfully ran"
      body = gateway.auth_only(jcb_params.merge({amount: '1'}))
      result = gateway.post(body)
    end

    it 'tests created profile first mastercard 5.1 A6' do
      skip "successfully ran"
      body = gateway.auth_only(first_master_card_params.merge({amount: '0'}))
      result = gateway.post(body)
    end

    it 'tests created profile first mastercard 5.1 A7' do
      skip "successfully ran"
      tmp = second_master_card_params.merge({amount: '0'})
      tmp[:account_num] = '2221000000000009'
      body = gateway.auth_only(tmp)
      result = gateway.post(body)
    end

  end

  describe "Auth and Capture tests" do

    let(:gateway) { Orbital::Gateway::Api::Authorization.new }

    it 'tests created profile amex 5.1 D1 a' do
      body = gateway.auth_and_capture(amex_params.merge({amount: '10000'}))
      result = gateway.post(body)
    end

    it 'tests created profile discover 5.1 A3' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(discover_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end

    it 'tests partial auth discover' do
      skip "successfully ran"
      body = gateway.auth_and_capture(discover_params.merge({amount: '7500', partial_auth_ind: 'Y', account_num: '6011000994116667'}))
      result = gateway.post(body)
    end

    it 'tests partial auth mastercard 26 3' do
      skip "successfully ran"
      body = gateway.auth_and_capture(second_master_card_params.merge({amount: '8000', partial_auth_ind: 'Y', account_num: '5555555555555565'}))
      result = gateway.post(body)
    end

    it 'tests partial auth mastercard 26 4' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(second_master_card_params.merge({amount: '8500', partial_auth_ind: 'Y', account_num: '5555556666666663'}))
      result = gateway.post(body)
    end

    it 'tests partial auth visa 26 5' do
      skip "successfully ran"
      body = gateway.auth_and_capture(visa_params.merge({amount: '9000', partial_auth_ind: 'Y', account_num: '4444445555555559'}))
      result = gateway.post(body)
    end

    it 'tests partial auth visa 26 6' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(visa_params.merge({amount: '9500', partial_auth_ind: 'Y', account_num: '4444444444444455'}))
      result = gateway.post(body)
    end

    it 'tests created profile discover retry' do
      skip "successfully ran"
      body = gateway.auth_and_capture(discover_params.merge({amount: '11100', order_id: 'RetryLogicTest1'}))
      result = gateway.post(body, '9999999999999999')
    end

    it 'tests created profile discover second retry test' do
      skip "successfully ran"
      body = gateway.auth_and_capture(discover_params.merge({amount: '11100', order_id: 'RetryLogicTest2'}))
      result = gateway.post(body, '9999999999999999')
    end

    it 'tests created profile jcb 5.1 A5' do
      skip "successfully ran"
      body = gateway.auth_and_capture(jcb_params.merge({amount: '10000'}))
      result = gateway.post(body)
    end

    it 'tests created profile visa 5.1 A8' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(visa_params.merge({amount: '10500'}))
      result = gateway.post(body)
    end
  
    it 'tests created profile first mastercard 5.1 A6' do
      skip "successfully ran"
      body = gateway.auth_and_capture(first_master_card_params.merge({amount: '10000'}))
      result = gateway.post(body)
    end

    it 'tests retry first master card' do
      skip "successfully ran"
      body = gateway.auth_and_capture(first_master_card_params.merge({amount: '11100', order_id: 'RetryLogicTest1'}))
      result = gateway.post(body, '9999999999999998')
    end

    it 'tests retry first master card' do
      skip "successfully ran"
      body = gateway.auth_and_capture(first_master_card_params.merge({amount: '11100', order_id: 'RetryLogicTest2'}))
      result = gateway.post(body, '9999999999999998')
    end

    it 'tests created profile second mastercard with new account 5.1 A7' do
      # skip "successfully ran"
      tmp = second_master_card_params.merge({amount: '10500'})
      tmp[:account_num] = '2321000000000008'
      body = gateway.auth_and_capture(tmp)
      result = gateway.post(body)
    end

    it 'tests created profile second mastercard 5.1 A7' do
      skip "successfully ran"
      tmp = second_master_card_params.merge({amount: '10000'})
      body = gateway.auth_and_capture(tmp)
      result = gateway.post(body)
    end

    it 'tests auth negative discover' do
      skip "successfully ran"
      body = gateway.auth_and_capture(discover_params.merge({amount: '30400'}))
      result = gateway.post(body)
    end

    it 'tests auth with capture negative jcb' do
      skip "successfully ran"
      body = gateway.auth_and_capture(jcb_params.merge({amount: '60500'}))
      result = gateway.post(body)
    end

    it 'tests auth with capture negative mastercard with suite' do
      skip "successfully ran"
      body = gateway.auth_and_capture(first_master_card_params.merge({amount: '40200'}))
      result = gateway.post(body)
    end

    it 'tests auth with capture negative mastercard second with different card number' do
      skip "successfully ran"
      tmp = second_master_card_params.merge({amount: '40100'})
      tmp[:account_num] = '2221000000000009'
      body = gateway.auth_and_capture(tmp)
      result = gateway.post(body)
    end

    it 'tests auth with capture negative visa' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(visa_params.merge({amount: '99900'}))
      result = gateway.post(body)
    end

    it 'tests auth with capture negative amex' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(amex_params.merge({amount: '53000'}))
      result = gateway.post(body)
    end

    it 'tests auth with capture failover amex' do
      # skip "successfully ran"
      body = gateway.auth_and_capture(amex_params.merge({amount: '10500'}))
      result = gateway.post(body)
    end

  end

  describe 'Refund' do

    let(:gateway) { Orbital::Gateway::Api::Authorization.new }

    it 'refunds visa class method' do
      purchase = Orbital::Gateway::Api::Authorization.auth_and_capture({order_id: SecureRandom.hex(8), customer_ref_num: visa_customer[:customer_ref_num], amount: '10000'})
      resp = Orbital::Gateway::Api::Authorization.refund(tx_ref_num: purchase.tx_ref_num)
    end

    it 'refund amex' do
      body = gateway.refund(amex_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end

    it 'refund discover' do
      # skip "successfully ran"
      body = gateway.refund(discover_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end

    it 'refund jcb' do
      body = gateway.refund(jcb_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end

    it 'refund visa' do
      body = gateway.refund(visa_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end
  
    it 'refund first mastercard' do
      body = gateway.refund(first_master_card_params.merge({amount: '1000'}))
      result = gateway.post(body)
    end

    it 'refund second mastercard' do
      tmp = second_master_card_params.merge({amount: '1000'})
      body = gateway.refund(tmp)
      result = gateway.post(body)
    end

    it 'voids second mastercard' do
      order_id = SecureRandom.hex(8)
      purchase = Orbital::Gateway::Api::Authorization.auth_and_capture(visa_params.merge({amount: '10000', order_id: order_id}))
      tmp = second_master_card_params.merge({tx_ref_num: purchase.tx_ref_num, order_id: order_id, tx_ref_idx: purchase.tx_ref_idx})
      result = Orbital::Gateway::Api::Authorization.void(tmp)
    end

    it 'voids amex' do
      order_id = 'AMEXvoid51G1'
      purchase = Orbital::Gateway::Api::Authorization.auth_and_capture(amex_params.merge({amount: '10000', order_id: order_id}))
      tmp = second_master_card_params.merge({tx_ref_num: purchase.tx_ref_num, order_id: order_id, tx_ref_idx: purchase.tx_ref_idx})
      result = Orbital::Gateway::Api::Authorization.void(tmp)
    end
  end
end
