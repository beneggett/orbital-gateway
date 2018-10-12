module Orbital
  module Gateway
    class OrbitalResponse::InquiryResponse < OrbitalResponse
      attr_reader :industry_type

      def initialize(response_xml)
        super
      end

      def to_s
        nokogiri.to_xml
      end

      def success?
      end
    end
  end
end


