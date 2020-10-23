FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a2a3a4a5a' }
    password_confirmation { password }
    first_name { 'あ' }
    last_name { 'い' }
    first_name_kana { 'ア' }
    last_name_kana { 'イ' }
    birth_date { Faker::Date.backward }
  end
end
