module Orbital
  module Gateway
    class OrbitalResponse::AuthorizationResponse < OrbitalResponse
      attr_reader :industry_type,
        :message_type,
        :merchant_id,
        :terminal_id,
        :card_brand,
        :account_num,
        :order_id,
        :tx_ref_num,
        :tx_ref_idx,
        :proc_status,
        :approval_status,
        :resp_code,
        :avs_resp_code,
        :cvv2_resp_code,
        :auth_code,
        :recurring_advice_cd,
        :cavv_resp_code,
        :status_msg,
        :resp_msg,
        :host_resp_code,
        :host_avs_resp_code,
        :host_cvv2_resp_code,
        :customer_ref_num,
        :customer_name,
        :profile_proc_status,
        :customer_profile_message,
        :resp_time,
        :partial_auth_occurred,
        :requested_amount,
        :redeemed_amount,
        :remaining_balance,
        :country_fraud_filter_status,
        :iso_country_code

      def initialize(response_xml, request_xml)
        super
        @message_type = nokogiri.at_css("Response MessageType")&.text
        @merchant_id = nokogiri.at_css("Response MerchantID")&.text
        @terminal_id = nokogiri.at_css("Response TerminalID")&.text
        @card_brand = nokogiri.at_css("Response CardBrand")&.text
        @account_num = nokogiri.at_css("Response AccountNum")&.text
        @order_id = nokogiri.at_css("Response OrderID")&.text
        @tx_ref_num = nokogiri.at_css("Response TxRefNum")&.text
        @tx_ref_idx = nokogiri.at_css("Response TxRefIdx")&.text
        @proc_status = nokogiri.at_css("Response ProcStatus")&.text
        @approval_status = nokogiri.at_css("Response ApprovalStatus")&.text
        @resp_code = nokogiri.at_css("Response RespCode")&.text
        @avs_resp_code = nokogiri.at_css("Response AVSRespCode")&.text
        @cvv2_resp_code = nokogiri.at_css("Response CVV2RespCode")&.text
        @auth_code = nokogiri.at_css("Response AuthCode")&.text
        @recurring_advice_cd = nokogiri.at_css("Response RecurringAdviceCd")&.text
        @cavv_resp_code = nokogiri.at_css("Response CAVVRespCode")&.text
        @status_msg = nokogiri.at_css("Response StatusMsg")&.text
        @resp_msg = nokogiri.at_css("Response RespMsg")&.text
        @host_resp_code = nokogiri.at_css("Response HostRespCode")&.text
        @host_avs_resp_code = nokogiri.at_css("Response HostAVSRespCode")&.text
        @host_cvv2_resp_code = nokogiri.at_css("Response HostCVV2RespCode")&.text
        @customer_ref_num = nokogiri.at_css("Response CustomerRefNum")&.text
        @customer_name = nokogiri.at_css("Response CustomerName")&.text
        @profile_proc_status = nokogiri.at_css("Response ProfileProcStatus")&.text
        @customer_profile_message = nokogiri.at_css("Response CustomerProfileMessage")&.text
        @resp_time = nokogiri.at_css("Response RespTime")&.text
        @partial_auth_occurred = nokogiri.at_css("Response PartialAuthOccurred")&.text
        @requested_amount = nokogiri.at_css("Response RequestedAmount")&.text
        @redeemed_amount = nokogiri.at_css("Response RedeemedAmount")&.text
        @remaining_balance = nokogiri.at_css("Response RemainingBalance")&.text
        @country_fraud_filter_status = nokogiri.at_css("Response CountryFraudFilterStatus")&.text
        @iso_country_code = nokogiri.at_css("Response IsoCountryCode")&.text
      end

      def to_s
        nokogiri.to_xml
      end

      def success?
        resp_code == '00' || approval_status.to_s == '1'
      end
    end
  end
end


