FactoryBot.define do
  factory :article do
    title_pt_br { "MyString" }
    title_es { "MyString" }
    description_pt_br { "MyString" }
    description_es { "MyString" }
    user { nil }
  end
end
