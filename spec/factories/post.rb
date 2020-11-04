FactoryBot.define do
  factory  :post do
    content                  {"これが表示される"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
