FactoryBot.define do
  factory :like do
    reference_id { 1 }
    reference_type { 'Video' }
    user_id { 1 }
    value { 1 }
  end
end
