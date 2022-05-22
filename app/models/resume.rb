class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :role
  has_many :skill_stools
  has_many :educations
  has_many :experiences

  enum status: {
    pending: 0,
    approved: 1,
  }

  end
