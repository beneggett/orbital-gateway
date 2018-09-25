require "test_helper"

class Orbital::Gateway::OrbitalResponse::ProfileResponseTest < Minitest::Test
  describe "response tests" do
    let(:xml) do
      <<-XML
        <Response>
          <ProfileResp>
            <CustomerBin>000001</CustomerBin>
            <CustomerMerchantID>351154</CustomerMerchantID>
            <CustomerName>EDWIN SCHMITT</CustomerName>
            <CustomerRefNum>03E04253906D1490</CustomerRefNum>
            <CustomerProfileAction>CREATE</CustomerProfileAction>
            <ProfileProcStatus>0</ProfileProcStatus>
            <CustomerProfileMessage>Profile Request Processed</CustomerProfileMessage>
            <CustomerAddress1>1 NORTHEASTERN BLVD</CustomerAddress1>
            <CustomerAddress2/>
            <CustomerCity>BEDFORD</CustomerCity>
            <CustomerState>NH</CustomerState>
            <CustomerZIP>03109-1234</CustomerZIP>
            <CustomerEmail>ryan@beatty.org</CustomerEmail>
            <CustomerPhone>4681227369</CustomerPhone>
            <CustomerCountryCode>US</CustomerCountryCode>
            <CustomerProfileOrderOverrideInd>NO</CustomerProfileOrderOverrideInd>
            <OrderDefaultDescription>Visa Test</OrderDefaultDescription>
            <OrderDefaultAmount>0</OrderDefaultAmount>
            <CustomerAccountType>CC</CustomerAccountType>
            <Status>A</Status>
            <CCAccountNum>XXXXXXXXXXXX4113</CCAccountNum>
            <CCExpireDate>0419</CCExpireDate>
            <ECPAccountDDA/>
            <ECPAccountType/>
            <ECPAccountRT/>
            <ECPBankPmtDlv/>
            <SwitchSoloStartDate/>
            <SwitchSoloIssueNum/>
            <RespTime/>
            <MITMsgType/>
            <MITSubmittedTransactionID/>
          </ProfileResp>
        </Response>
      XML
    end
    let(:response) { Orbital::Gateway::OrbitalResponse::ProfileResponse.new(xml) }

    it 'populates values' do
      assert_equal response.customer_bin, '000001'
    end
  end
end

