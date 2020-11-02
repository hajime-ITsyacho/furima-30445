FactoryBot.define do
  factory :pay do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    area_id { 2 }
    city { 'あいうえお' }
    house_num { '1-1-1' }
    building_name { 'ビル101' }
    phone_num { '00000000000' }
  end
end
