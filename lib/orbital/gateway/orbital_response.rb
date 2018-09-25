module Orbital
  module Gateway
    class OrbitalResponse
      attr_accessor :nokogiri
      def initialize(response_xml)
        @nokogiri = Nokogiri.parse response_xml
      end
    end
  end
end
