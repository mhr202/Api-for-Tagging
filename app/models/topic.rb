class Topic < ApplicationRecord
  belongs_to :campaign
  has_many :comments

  validates :title, presence: true
end
