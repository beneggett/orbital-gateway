module Orbital
  module Gateway
    class Api::Customer < Api
      def add_bin_merchant_and_terminal(xml)
        xml.tag! :CustomerBin, bin
        xml.tag! :CustomerMerchantID, ::Orbital::Gateway::Api::ORBITAL_MERCHANT_ID
        # xml.tag! :TerminalID, "parameters[:terminal_id] || '001'"
      end

      def xml_body(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :Profile do
            add_xml_credentials(xml)
            add_bin_merchant_and_terminal(xml)
            add_data(xml, parameters)
          end
        end
      end

      def add_data(xml, parameters)
        xml.tag! :CustomerName,                     parameters[:customer_name]
        xml.tag! :CustomerRefNum,                   parameters[:customer_ref_num]
        xml.tag! :CustomerAddress1,                 parameters[:customer_address_one]
        xml.tag! :CustomerAddress2,                 parameters[:customer_address_two] if parameters[:customer_address_two]
        xml.tag! :CustomerCity,                     parameters[:customer_city]
        xml.tag! :CustomerState,                    parameters[:customer_state]
        xml.tag! :CustomerZIP,                      parameters[:customer_zip]
        xml.tag! :CustomerEmail,                    parameters[:customer_email]
        xml.tag! :CustomerPhone,                    parameters[:customer_phone]
        xml.tag! :CustomerCountryCode,              parameters[:customer_country_code]
        xml.tag! :CustomerProfileAction,            action(parameters[:customer_profile_action])
        xml.tag! :CustomerProfileOrderOverrideInd,  'NO'
        xml.tag! :CustomerProfileFromOrderInd,      'S'
        xml.tag! :OrderDefaultDescription,          parameters[:order_default_description]
        xml.tag! :OrderDefaultAmount,               parameters[:order_default_amount]
        xml.tag! :CustomerAccountType,              'CC'
        xml.tag! :Status,                           'A'
        xml.tag! :CCAccountNum,                     parameters[:credit_card_number]
        xml.tag! :CCExpireDate,                     parameters[:expiration_date]
        xml.target!
      end

      def action(chosen_action)
        available_actions = {
          create:   'C',
          retrieve: 'R',
          update:   'U',
          delete:   'D'
        }
        available_actions[chosen_action]
      end
    end
  end
end
