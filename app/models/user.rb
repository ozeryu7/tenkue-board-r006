class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, exclusion: { in: [/^[ぁ-んァ-ヶー一-龠]+$/] }, presence: true, uniqueness: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i }, presence: true, length: { in: 8..32 }

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

