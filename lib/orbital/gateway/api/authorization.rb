module Orbital
  module Gateway
    class Api::Authorization < Api
      class << self
        def void(parameters)
          gateway = new
          xml_data = gateway.void(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::AuthorizationResponse.new(response)
        end

        def auth_and_capture(parameters, retry_trace=nil)
          gateway = new
          xml_data = gateway.auth_and_capture(parameters)
          response = gateway.post(xml_data, retry_trace || rand(9999999999999999))
          OrbitalResponse::AuthorizationResponse.new(response)
        end

        def auth_only(parameters)
          gateway = new
          xml_data = gateway.auth_only(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::AuthorizationResponse.new(response)
        end
      end

      def add_bin_merchant_and_terminal(xml)
        xml.tag! :BIN, bin
        xml.tag! :MerchantID, ::Orbital::Gateway::Api::ORBITAL_MERCHANT_ID
        xml.tag! :TerminalID, '001'
      end

      def auth_only(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :NewOrder do
            add_xml_credentials(xml)
            xml.tag! :IndustryType, 'EC'
            xml.tag! :MessageType, 'A'
            add_bin_merchant_and_terminal(xml)
            add_data(xml, parameters)
          end
        end
      end

      def auth_and_capture(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :NewOrder do
            add_xml_credentials(xml)
            xml.tag! :IndustryType, 'EC'
            xml.tag! :MessageType, 'AC'
            add_bin_merchant_and_terminal(xml)
            add_data(xml, parameters)
          end
        end
      end

      def refund(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :NewOrder do
            add_xml_credentials(xml)
            xml.tag! :IndustryType, 'EC'
            xml.tag! :MessageType, 'R'
            add_bin_merchant_and_terminal(xml)
            add_data(xml, parameters)
          end
        end
      end

      def void(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :Reversal do
            add_xml_credentials(xml)
            void_data(xml, parameters)
            xml.target!
          end
        end
      end

      def add_data(xml, parameters)
        xml.tag! :CardBrand,                parameters[:card_brand]
        xml.tag! :AccountNum,                 parameters[:account_num]
        xml.tag! :Exp,                        parameters[:expiration_date]
        xml.tag! :CurrencyCode,               CURRENCY_CODES.fetch(parameters[:currency_country], '840')
        xml.tag! :CurrencyExponent,           CURRENCY_EXPONENTS.fetch(parameters[:currency_country], '2')
        xml.tag! :AVSzip,                     parameters[:avs_zip]
        xml.tag! :AVSaddress1,                parameters[:avs_address_one]
        xml.tag! :AVSaddress2,                parameters[:avs_address_two]
        xml.tag! :AVScity,                    parameters[:avs_city]
        xml.tag! :AVSstate,                   parameters[:avs_state]
        xml.tag! :AVSphoneNum,                parameters[:avs_phone]
        # xml.tag! :CustomerProfileFromOrderInd, parameters[:customer_profile_from_order_ind]
        xml.tag! :CustomerRefNum,              parameters[:customer_ref_num]
        xml.tag! :OrderID,            parameters[:order_id]
        xml.tag! :Amount,             parameters[:amount]
        xml.tag!(:PartialAuthInd,     parameters[:partial_auth_ind]) if parameters[:partial_auth_ind]
        # xml.tag!(:DPANInd,            parameters[:dpan_ind]) if parameters[:dpan_ind]
        # add_cryptogram(xml, parameters) if parameters[:dpan_ind].to_s == 'Y'
        xml.target!
      end

      def void_data(xml, parameters)
        xml.tag! :TxRefNum, parameters[:tx_ref_num]
        xml.tag! :TxRefIdx, parameters[:tx_ref_idx]
        xml.tag! :AdjustedAmt, parameters[:amount] if parameters[:amount]
        xml.tag! :OrderID, parameters[:order_id]
        add_bin_merchant_and_terminal(xml)
        xml.tag! :ReversalRetryNumber, parameters[:reversal_retry_number] if parameters[:reversal_retry_number]
        xml.tag! :OnlineReversalInd,   parameters[:online_reversal_ind]   if parameters[:online_reversal_ind]
      end

      def inquery_data(xml, parameters)
        xml.tag! :OrderID, parameters[:order_id]
        xml.tag! :InquiryRetryNumber, parameters[:inquiry_retry_number]
      end

      def add_cryptogram(xml, parameters)
        card_brand = parameters[:card_brand]
        if card_brand == 'VI'
          xml.tag!(:CAVV,             Base64.encode64(parameters[:avs_cvv]).strip)
        end
      end
    end
  end
end
