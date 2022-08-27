FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_kanji_sei        {'山田'}
    name_kanji_mei        {'太郎'} 
    name_kana_sei         {'ヤマダ'}
    name_kana_mei         {'タロウ'}
    birth_day             {"2000-01-01"}
  end
end
