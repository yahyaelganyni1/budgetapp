FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
    user

    factory :category_purchases do
      transient do
        purchases_count { 10 }
      end

      purchases do
        Array.new(purchases_count) { association(:purchase) }
      end
    end
  end
end
