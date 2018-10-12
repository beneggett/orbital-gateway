module Orbital
  module Gateway
    class Api::Inquiry < Api
      class << self
        def find_request(retry_trace_number)
          gateway = new
          xml_data = gateway.xml_body({retry_trace_number: retry_trace_number})
          response = gateway.post(xml_data)
          OrbitalResponse::InquiryResponse.new(response)
        end
      end

      def xml_body(parameters)
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :Inquiry do
            add_xml_credentials(xml)
            add_bin_merchant_and_terminal(xml)
            add_data(xml, parameters)
          end
        end
      end

      def add_data(xml, parameters)
        xml.tag! :OrderID,                          parameters[:order_id]
        xml.tag! :InquiryRetryNumber,               parameters[:retry_trace_number]
      end

    end
  end
end
