class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, exclusion: { in: [/^[ぁ-んァ-ヶー一-龠]+$/] }, presence: true, uniqueness: true
  validates :password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }, presence: true, length: { in: 8..32 }
end
