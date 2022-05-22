class Experience < ApplicationRecord
  has_many :publications
  belongs_to :resume
end