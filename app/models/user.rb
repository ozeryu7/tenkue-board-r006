class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, exclusion: { in: [/^[ぁ-んァ-ヶー一-龠]+$/] }, presence: true, uniqueness: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i }, presence: true, length: { in: 8..32 }

      
  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'ゲストユーザ') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
  end
end