module Orbital
  module Gateway
    class OrbitalResponse::ProfileResponse < OrbitalResponse
      attr_reader :customer_bin,
        :customer_merchant_id,
        :customer_bin,
        :customer_merchant_id,
        :customer_name,
        :customer_ref_num,
        :customer_profile_action,
        :profile_proc_status,
        :customer_profile_message,
        :customer_address_one,
        :customer_address_two,
        :customer_city,
        :customer_state,
        :customer_zip,
        :customer_email,
        :customer_phone,
        :customer_country_code,
        :customer_profile_order_override_ind,
        :order_default_description,
        :order_default_amount,
        :customer_account_type,
        :status,
        :cc_account_num,
        :cc_expire_date,
        :ecp_account_dda,
        :ecp_account_type,
        :ecp_account_rt,
        :ecp_bank_pmt_dlv,
        :switch_solo_start_date,
        :swith_solo_issue_num,
        :resp_time,
        :mit_msg_type,
        :mit_submitted_transaction_id

      def initialize(response_xml)
        super
        @customer_bin = nokogiri.at_css("Response ProfileResp CustomerBin")&.text
        @customer_merchant_id = nokogiri.at_css("Response ProfileResp CustomerMerchantID")&.text
        @customer_name = nokogiri.at_css("Response ProfileResp CustomerName")&.text
        @customer_ref_num = nokogiri.at_css("Response ProfileResp CustomerRefNum")&.text
        @customer_profile_action = nokogiri.at_css("Response ProfileResp CustomerProfileAction")&.text
        @profile_proc_status = nokogiri.at_css("Response ProfileResp ProfileProcStatus")&.text
        @customer_profile_message = nokogiri.at_css("Response ProfileResp CustomerProfileMessage")&.text
        @customer_address_one = nokogiri.at_css("Response ProfileResp CustomerAddress1")&.text
        @customer_address_two = nokogiri.at_css("Response ProfileResp CustomerAddress2")&.text
        @customer_city = nokogiri.at_css("Response ProfileResp CustomerCity")&.text
        @customer_state = nokogiri.at_css("Response ProfileResp CustomerState")&.text
        @customer_zip = nokogiri.at_css("Response ProfileResp CustomerZIP")&.text
        @customer_email = nokogiri.at_css("Response ProfileResp CustomerEmail")&.text
        @customer_phone = nokogiri.at_css("Response ProfileResp CustomerPhone")&.text
        @customer_country_code = nokogiri.at_css("Response ProfileResp CustomerCountryCode")&.text
        @customer_profile_order_override_ind = nokogiri.at_css("Response ProfileResp CustomerProfileOrderOverrideInd")&.text
        @order_default_description = nokogiri.at_css("Response ProfileResp OrderDefaultDescription")&.text
        @order_default_amount = nokogiri.at_css("Response ProfileResp OrderDefaultAmount")&.text
        @customer_account_type = nokogiri.at_css("Response ProfileResp CustomerAccountType")&.text
        @status = nokogiri.at_css("Response ProfileResp Status")&.text
        @cc_account_num = nokogiri.at_css("Response ProfileResp CCAccountNum")&.text
        @cc_expire_date = nokogiri.at_css("Response ProfileResp CCExpireDate")&.text
        @ecp_account_dda = nokogiri.at_css("Response ProfileResp ECPAccountDDA")&.text
        @ecp_account_type = nokogiri.at_css("Response ProfileResp ECPAccountType")&.text
        @ecp_account_rt = nokogiri.at_css("Response ProfileResp ECPAccountRT")&.text
        @ecp_bank_pmt_dlv = nokogiri.at_css("Response ProfileResp ECPBankPmtDlv")&.text
        @switch_solo_start_date = nokogiri.at_css("Response ProfileResp SwitchSoloStartDate")&.text
        @swith_solo_issue_num = nokogiri.at_css("Response ProfileResp SwitchSoloIssueNum")&.text
        @resp_time = nokogiri.at_css("Response ProfileResp RespTime")&.text
        @mit_msg_type = nokogiri.at_css("Response ProfileResp MITMsgType")&.text
        @mit_submitted_transaction_id = nokogiri.at_css("Response ProfileResp MITSubmittedTransactionID")&.text
      end

      def to_s
        nokogiri.to_xml
      end

      def success?
        profile_proc_status == '0'
        # Example of a failure
        # <ProfileProcStatus>9581</ProfileProcStatus>
        # <CustomerProfileMessage>Profile: Cannot Read profile. Profile does not exist for Cust Ref Num: [62E66156562D01C7] and MID: [351154].</CustomerProfileMessage>
      end
    end
  end
end


