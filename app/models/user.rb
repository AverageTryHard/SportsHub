class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  enum status: { active: 'active', blocked: 'blocked' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :avatar, presence: false

  def full_name
    "#{first_name} #{last_name}"
  end
end
