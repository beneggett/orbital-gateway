module Orbital
  module Gateway
    class Api::Authorization < Api
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

      def add_data(xml, parameters)
        # xml.tag! :CardBrand,          parameters[:card_brand]
        xml.tag! :AccountNum,         parameters[:account_number]
        xml.tag! :Exp,                parameters[:expiration_date]
        xml.tag! :CurrencyCode,       CURRENCY_CODES.fetch(parameters[:currency_country], '840')
        xml.tag! :CurrencyExponent,   CURRENCY_EXPONENTS.fetch(parameters[:currency_country], '2')
        xml.tag! :AVSzip,             parameters[:avs_zip]
        xml.tag! :AVSaddress1,        parameters[:avs_address_one]
        xml.tag! :AVSaddress2,        parameters[:avs_address_two]
        xml.tag! :AVScity,            parameters[:avs_city]
        xml.tag! :AVSstate,           parameters[:avs_state]
        xml.tag! :AVSphoneNum,        parameters[:avs_phone]
        xml.tag! :OrderID,            parameters[:order_id]
        xml.tag! :Amount,             parameters[:amount]
        xml.target!
      end
    end
  end
end
