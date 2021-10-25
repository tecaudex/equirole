class Resume < ApplicationRecord
  belongs_to :user
  has_many :skill_stools
  has_many :educations
  has_many :experiences

  end
