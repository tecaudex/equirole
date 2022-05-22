class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resumes
  has_many :ads

  enum role: {
    user: 0,
    admin: 1
  }

  def admin
    return true if current_user.role == 'admin'
  end
end
