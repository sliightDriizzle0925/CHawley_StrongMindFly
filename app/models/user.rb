class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  ROLES = %w[chef owner]

  def chef?
    roles == "chef"
  end

  def owner?
    roles == "owner"
  end
end
