FactoryBot.define do
  factory  :user do
    name                      {"name"}
    email                     {Faker::Internet.free_email}
    password                  {"test0000"}
    password_confirmation     {"test0000"}
  end
end 
