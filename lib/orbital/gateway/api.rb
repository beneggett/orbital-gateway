module Orbital
  module Gateway
    class Api
      URL_ENDPOINT = ENV.fetch("ORBITAL_GATEWAY_BASE_URL", "https://orbitalvar1.chasepaymentech.com/authorize")
      API_VERSION = ENV.fetch("ORBITAL_GATEWAY_API_VERSION", "7.4")
      ORBITAL_MERCHANT_ID = ENV.fetch("ORBITAL_MERCHANT_ID", "not-configured")
      ORBITAL_CONNECTION_ID = ENV.fetch("ORBITAL_CONNECTION_ID", "not-configured")
      ORBITAL_CONNECTION_PASSWORD = ENV.fetch("ORBITAL_CONNECTION_PASSWORD", "not-configured")
      BIN = ENV.fetch("ORBITAL_BIN", "stratus")
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

      def post(body, trace_number=nil)
        response = self.class.post(URL_ENDPOINT, body: body, timeout: 30, headers: modify_headers(body.size.to_s, trace_number))
        # api_type = options[:type] || options[:customer_vault]
        # handle_response(response, api_type)
      end

      private

      def modify_headers(size, trace_number=nil)
        # headers["Content-Length"] = size
        head = headers
        head.merge!('Trace-Number' => trace_number,
                       'Merchant-Id'  => ORBITAL_MERCHANT_ID) if trace_number
        head
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

      def bin
        available_bins = {
          'stratus' => '000001',
          'pns'     => '000002'
        }
        available_bins[BIN]
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
            add_bin_merchant_and_terminal(xml)
          end
        end
      end

      def xml_envelope
        xml = Builder::XmlMarkup.new(:indent => 2)
        xml.instruct!(:xml, :version => '1.0', :encoding => 'UTF-8')
        xml
      end

      def add_xml_credentials(xml)
        xml.tag! :OrbitalConnectionUsername, ORBITAL_CONNECTION_ID
        xml.tag! :OrbitalConnectionPassword, ORBITAL_CONNECTION_PASSWORD
      end

      def add_bin_merchant_and_terminal(xml)
        xml.tag! :BIN, bin
        xml.tag! :MerchantID, ORBITAL_MERCHANT_ID
        xml.tag! :TerminalID, '001'
      end

      CURRENCY_CODES = {
        'AUD' => '036',
        'BRL' => '986',
        'CAD' => '124',
        'CLP' => '152',
        'CZK' => '203',
        'DKK' => '208',
        'HKD' => '344',
        'ICK' => '352',
        'JPY' => '392',
        'MXN' => '484',
        'NZD' => '554',
        'NOK' => '578',
        'SGD' => '702',
        'SEK' => '752',
        'CHF' => '756',
        'GBP' => '826',
        'USD' => '840',
        'EUR' => '978'
      }

      CURRENCY_EXPONENTS = {
        'AUD' => '2',
        'BRL' => '2',
        'CAD' => '2',
        'CLP' => '2',
        'CZK' => '2',
        'DKK' => '2',
        'HKD' => '2',
        'ICK' => '2',
        'JPY' => '0',
        'MXN' => '2',
        'NZD' => '2',
        'NOK' => '2',
        'SGD' => '2',
        'SEK' => '2',
        'CHF' => '2',
        'GBP' => '2',
        'USD' => '2',
        'EUR' => '2'
      }

    end
  end
end
