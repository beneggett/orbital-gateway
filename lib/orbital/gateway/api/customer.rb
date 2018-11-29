module Orbital
  module Gateway
    class Api::Customer < Api
      class << self
        def create_profile(parameters)
          gateway = new
          xml_data = gateway.create_profile(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::ProfileResponse.new(response, xml_data)
        end

        def update_profile(parameters)
          gateway = new
          xml_data = gateway.update_profile(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::ProfileResponse.new(response, xml_data)
        end

        def delete_profile(parameters)
          gateway = new
          xml_data = gateway.delete_profile(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::ProfileResponse.new(response, xml_data)
        end

        def retrieve_profile(parameters)
          gateway = new
          xml_data = gateway.retrieve_profile(parameters)
          response = gateway.post(xml_data)
          OrbitalResponse::ProfileResponse.new(response, xml_data)
        end
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

      def create_profile(parameters)
        xml_body(parameters.merge({customer_profile_action: :create}))
      end

      def update_profile(parameters)
        xml_body(parameters.merge({customer_profile_action: :update}))
      end

      def delete_profile(parameters)
        xml_body(parameters.merge({customer_profile_action: :delete}))
      end

      def retrieve_profile(parameters)
        xml_body(parameters.merge({customer_profile_action: :retrieve}))
      end

      private

      def add_bin_merchant_and_terminal(xml)
        xml.tag! :CustomerBin, bin
        xml.tag! :CustomerMerchantID, orbital_merchant_id
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
        xml.tag!(:CustomerProfileOrderOverrideInd,  'NO') unless parameters[:customer_profile_action] == :delete
        if parameters[:customer_profile_action] == :create
          xml.tag! :CustomerProfileFromOrderInd,      'S'
        end
        xml.tag! :OrderDefaultDescription,          parameters[:order_default_description]
        xml.tag! :OrderDefaultAmount,               parameters[:order_default_amount]
        xml.tag!(:CustomerAccountType,              'CC') unless parameters[:customer_profile_action] == :delete
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
