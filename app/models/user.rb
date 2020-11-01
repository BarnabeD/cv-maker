class User < ApplicationRecord
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :password_expirable,
         :secure_validatable, email_validation: false

  def is_admin?
    self.admin
  end
end
