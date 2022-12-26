class Campaign < ApplicationRecord
  belongs_to :user
  has_one :topic, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  DURATION = [
    'within 1 week',
    'within 1 month',
    'within 3 months'
  ].freeze

  validates :duration, inclusion: { in: DURATION }
  validates :title, :duration, presence: true
end
