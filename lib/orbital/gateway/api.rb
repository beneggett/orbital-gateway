module Orbital
  module Gateway
    class Api
      URL_ENDPOINT = ENV.fetch("ORBITAL_GATEWAY_BASE_URL", "https://orbitalvar1.chasepaymentech.com/authorize")
      API_VERSION = ENV.fetch("ORBITAL_GATEWAY_API_VERSION", "7.5")

      include HTTParty

      def initialize(options = {})
        # @username = options[:username] || ENV["PPG_USERNAME"]
        # @password = options[:password] || ENV["PPG_PASSWORD"]
      end

      # def get(options={})
      #   response = self.class.get(URL_ENDPOINT, query: options, timeout: 30, headers: headers)
      #   # api_type = options[:type] || options[:report_type]
      #   # handle_response(response, api_type)
      # end

      def post(body)
        response = self.class.post(URL_ENDPOINT, body: body, timeout: 30, headers: modify_headers(body.size.to_s))
        # api_type = options[:type] || options[:customer_vault]
        # handle_response(response, api_type)
      end

      private

      def modify_headers(size)
        headers["Content-Length"] = size
        headers
      end

      def headers
        {
          'MIME-Version' => '1.1',
          'Content-Type' => "application/PTI#{API_VERSION.gsub(/\./, '')}",
          'Content-Transfer-Encoding' => 'text',
          'Request-Number' => '1',
          'Document-Type' => 'Request',
          'Interface-Version' => 'Ruby|Orbital Gateway'
        }
      end

      # Will need to add these in to the headers
    #   headers = POST_HEADERS.merge('Content-length' => order.size.to_s)
    #   headers.merge!( 'Trace-number' => trace_number.to_s,
    #                   'Merchant-Id' => @options[:merchant_id] ) if @options[:retry_logic] && trace_number
    #   request = lambda{|url| parse(ssl_post(url, order, headers))}

      def credentials
        # ENV.fetch("ORBITAL_CONNECTION_ID", "not-implemented"]
        # ENV.fetch("ORBITAL_CONNECTION_PASSWORD", "not-implemented"]
        # {username: username, password: password }
      end

      def base_request
        xml = xml_envelope
        xml.tag! :Request do
          xml.tag! :NewOrder do
            add_xml_credentials(xml)
          end
        end
      end

      def xml_envelope
        xml = Builder::XmlMarkup.new(:indent => 2)
        xml.instruct!(:xml, :version => '1.0', :encoding => 'UTF-8')
        xml
      end

      def add_xml_credentials(xml)
        xml.tag! :OrbitalConnectionUsername, ENV.fetch("ORBITAL_CONNECTION_ID", "not-implemented")

        xml.tag! :OrbitalConnectionPassword, ENV.fetch("ORBITAL_CONNECTION_PASSWORD", "not-implemented")

      end

      def add_bin_merchant_and_terminal(xml, parameters)
        xml.tag! :BIN, "bin"
        xml.tag! :MerchantID, "@options[:merchant_id]"
        xml.tag! :TerminalID, "parameters[:terminal_id] || '001'"
      end


    end
  end
end
