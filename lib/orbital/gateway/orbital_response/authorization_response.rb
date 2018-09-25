module Orbital
  module Gateway
    class OrbitalResponse::AuthorizationResponse < OrbitalResponse
      attr_reader :nokogiri

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


