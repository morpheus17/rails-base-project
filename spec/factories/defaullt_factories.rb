FactoryBot.define do
  factory :user do

    trait :buyer do
      email {'buyer@gmail.com'}
      username {'buyer'}
      # role_id buyer_role.id,
      password {'123456'}
      password_confirmation {'123456'}
    end

    trait :broker do
      email {'broker@gmail.com'}
      username {'broker'}
      # role_id buyer_role.id,
      password {'123456'}
      password_confirmation {'123456'}
    end

    trait :admin do
      email {'admin@gmail.com'}
      username {'admin'}
      # role_id buyer_role.id,
      password {'123456'}
      password_confirmation {'123456'}
    end
  end
end

FactoryBot.define do
  factory :role do
    trait :buyer do
      role_name {"buyer"}
    end

    trait :broker do
      role_name {"broker"}
    end

    trait :admin do
      role_name {"admin"}
    end
  end
end

FactoryBot.define do
  factory :stock do
    trait :msft do
      name { "MSFT" }
      amount { 125.01 }
      quantity { 1 }
      # user_id: buyer.id
    end
  end
end

FactoryBot.define do
  factory :transaction do
    trait :default do
      total_amount { 125.01 }
      quantity { 1 }
      price { 125.01 }
      # stock_id: stock.id, 
      seller_id { nil }
      # buyer_id: buyer.id
    end
  end
end

FactoryBot.define do
  factory :market do
    name { nil }
    user_id { nil }
  end
end