FactoryBot.define do

  factory :user do
    nickname {"aaa"}
    email {"aaa@gmail.com"}
    password {"aaaa11"}
    password_confirmation {password}
    last_name {"赤沙汰"}
    last_name_kana {"アカサタ"}
    first_name {"濱家ら"}
    first_name_kana {"ハマヤラ"}
    birthday {"2020-02-02"}
  end

end