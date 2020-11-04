FactoryBot.define do
  factory  :user do
    name                      {"name"}
    email                     {Faker::Internet.free_email}
    password                  {"00000000"}
    password_confirmation     {"00000000"}
  end
end 
