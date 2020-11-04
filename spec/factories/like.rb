FactoryBot.define do
  factory  :like do
    association :post
    user        { post.user }
    created_at  { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end 
