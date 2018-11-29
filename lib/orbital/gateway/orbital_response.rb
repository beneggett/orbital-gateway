module Orbital
  module Gateway
    class OrbitalResponse
      attr_accessor :nokogiri, :request_xml
      def initialize(response_xml, request_xml)
        @nokogiri = Nokogiri.parse response_xml
        @request_xml = request_xml
      end
    end
  end
end
