FactoryBot.define do
  factory :comment do
    description { "MyString" }
    language { "MyString" }
    allowed { false }
    video { nil }
    article { nil }
  end
end
