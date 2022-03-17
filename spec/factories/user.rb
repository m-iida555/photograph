FactoryBot.define do
    factory :user do
      name { "Sample" }
      email { "Sample@gmail.com" }
      password { "0123456789" }
      password_confirmation { "0123456789" }
      address { "サンプル県" }
      telephone { "01234567890" }
      birth_year { "1988" }
      birth_month { "12" }
      birth_day { "31" }
    end
  end