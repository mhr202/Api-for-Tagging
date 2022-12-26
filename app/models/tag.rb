class Tag < ApplicationRecord
  self.inheritance_column = 'type'
  has_many :sub_tags, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :campaign, through: :taggings
end
