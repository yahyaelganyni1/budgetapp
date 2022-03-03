FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { 'topsecret' }

    factory :user_categories do
      transient do
        categories_count { 10 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end

      factory :user_purchases do
        transient do
          purchases_count { 10 }
        end

        purchases do
          Array.new(purchases_count) { association(:purchase) }
        end
      end
    end
  end
end
