module CustomerCreditCards
  def amex_params
    {
      customer_address_one:       '4 Northeastern Blvd',
      customer_city:              'Salem',
      customer_state:             'NH',
      customer_zip:               '03105',
      customer_cvv:               '1234',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Amex Test',
      expiration_date:            '0422',
      credit_card_number:         '341134113411347'
    }
  end

  def visa_params
    {
      customer_address_one:       '1 Northeastern Blvd',
      customer_city:              'Bedford',
      customer_state:             'NH',
      customer_zip:               '03109-1234',
      customer_cvv:               '411',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Visa Test',
      expiration_date:            '0419',
      credit_card_number:         '4112344112344113'
    }
  end

  def order_visa_params
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
      customer_address_one:       '1 Northeastern Blvd',
      customer_city:              'Bedford',
      customer_state:             'NH',
      customer_zip:               '03109',
      customer_cvv:               '613',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Discover Test',
      expiration_date:            '0420',
      credit_card_number:         '6559906559906557'
    }
  end

  def jcb_params
    {
      customer_address_one:       '5 Northeastern Blvd',
      customer_city:              'Nashua',
      customer_state:             'NH',
      customer_zip:               '03060',
      customer_cvv:               '611',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'JCB Test',
      expiration_date:            '0420',
      credit_card_number:         '3528000000000007'
    }
  end

  def chase_net_params
    {
      customer_address_one:       '1 Northeastern Blvd',
      customer_city:              'Bedford',
      customer_state:             'NH',
      customer_zip:               '03109-1234',
      customer_cvv:               '444',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Chase Net Test',
      expiration_date:            '0821',
      credit_card_number:         '4559961111111118'
    }
  end

  def first_master_card_params
    {
      customer_address_one:       '5 Northeastern Blvd Suite 100',
      customer_city:              'Bedford',
      customer_state:             'NH',
      customer_zip:               '03101',
      customer_cvv:               '123',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Master Card With Suite Test',
      expiration_date:            '0221',
      credit_card_number:         '5112345112345114'
    }
  end

  def second_master_card_params
    {
      customer_address_one:       '22 Bayou Ave',
      customer_city:              'Concord',
      customer_state:             'NH',
      customer_zip:               '03301-6789',
      customer_cvv:               '567',
      customer_email:             Faker::Internet.email,
      customer_name:              Faker::Name.name,
      customer_ref_num:           SecureRandom.hex(8),
      customer_phone:             Faker::Number.number(10),
      customer_country_code:      'US',
      order_default_description:  'Master Card Test',
      expiration_date:            '0919',
      credit_card_number:         '2421000000000007'
    }
  end
end
