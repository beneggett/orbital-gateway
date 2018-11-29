module OrderCreditCards
  def amex_params
    {
      avs_address_one:       '4 Northeastern Blvd',
      avs_city:              'Salem',
      avs_state:             'NH',
      avs_zip:               '03105',
      avs_cvv:               '1234',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:       '0422',
      account_num:        '341134113411347',
      card_brand:            'AX'
    }
  end

  def visa_params
    {
      avs_address_one:       '1 Northeastern Blvd',
      avs_city:              'Bedford',
      avs_state:             'NH',
      avs_zip:               '03109-1234',
      avs_cvv:               '411',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:       '0419',
      account_num:        '4112344112344113',
      card_brand:            'VI'
    }
  end

  def discover_params
    {
      avs_address_one:       '1 Northeastern Blvd',
      avs_city:              'Bedford',
      avs_state:             'NH',
      avs_zip:               '03109',
      avs_cvv:               '613',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:       '0420',
      account_num:    '6559906559906557',
      card_brand:            'DI'
    }
  end

  def jcb_params
    {
      avs_address_one:       '5 Northeastern Blvd',
      avs_city:              'Nashua',
      avs_state:             'NH',
      avs_zip:               '03060',
      avs_cvv:               '611',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:            '0420',
      account_num:         '3528000000000007',
      card_brand:            'JC'
    }
  end

  def chase_net_params
    {
      avs_address_one:       '1 Northeastern Blvd',
      avs_city:              'Bedford',
      avs_state:             'NH',
      avs_zip:               '03109-1234',
      avs_cvv:               '444',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:            '0821',
      account_num:         '4559961111111118',
      card_brand:            'CHASENET'
    }
  end

  def first_master_card_params
    {
      avs_address_one:       '5 Northeastern Blvd Suite 100',
      avs_city:              'Bedford',
      avs_state:             'NH',
      avs_zip:               '03101',
      avs_cvv:               '123',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:            '0221',
      account_num:         '5112345112345114',
      card_brand:            'MC'
    }
  end

  def second_master_card_params
    {
      avs_address_one:       '22 Bayou Ave',
      avs_city:              'Concord',
      avs_state:             'NH',
      avs_zip:               '03301-6789',
      avs_cvv:               '567',
      avs_email:             Faker::Internet.email,
      avs_name:              Faker::Name.name,
      avs_phone:             Faker::Number.number(10),
      order_id:              SecureRandom.hex(8),
      expiration_date:            '0919',
      account_num:         '2421000000000007',
      card_brand:            'MC'
    }
  end

  def visa_customer
    {
      cc_account_num: "XXXXXXXXXXXX4113",
      cc_expire_date: "0419",
      customer_account_type: "CC",
      customer_address_one: "1 NORTHEASTERN BLVD",
      customer_address_two: "",
      customer_bin: "000001",
      customer_city: "BEDFORD",
      customer_country_code: "US",
      customer_email: "tracy@gerhold.info",
      customer_merchant_id: "351154",
      customer_name: "HERMAN QUITZON",
      customer_phone: "1854558458",
      customer_profile_action: "CREATE",
      customer_profile_message: "Profile Request Processed",
      customer_profile_order_override_ind: "NO",
      customer_ref_num: "5DF2BCA237A73A9A",
      customer_state: "NH",
      customer_zip: "03109-1234",
      ecp_account_dda: "",
      ecp_account_rt: "",
      ecp_account_type: "",
      ecp_bank_pmt_dlv: "",
      mit_msg_type: "",
      mit_submitted_transaction_id: "",
      nokogiri: nil,
      order_default_amount: "0",
      order_default_description: nil,
      profile_proc_status: "0",
      request_xml: nil,
      resp_time: "",
      status: "A",
      switch_solo_start_date: "",
      swith_solo_issue_num: ""
    }
  end
end
