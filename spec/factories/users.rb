FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation { password }
    name_kanji_sei        { '山田' }
    name_kanji_mei        { '太郎' }
    name_kana_sei         { 'ヤマダ' }
    name_kana_mei         { 'タロウ' }
    birth_day             { '2000-01-01' }
  end
end
