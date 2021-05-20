FactoryBot.define do

  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name {"赤沙汰"}
    last_name_kana {"アカサタ"}
    first_name {"濱家ら"}
    first_name_kana {"ハマヤラ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end

end