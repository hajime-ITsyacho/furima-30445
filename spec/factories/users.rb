FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { 'あ' }
    last_name { 'い' }
    first_name_kana { 'ア' }
    last_name_kana { 'イ' }
    birth_date { Faker::Date.backward }
  end
end
