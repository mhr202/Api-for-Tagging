class CampaignSerializer < ActiveModel::Serializer
  attributes :title, :purpose, :duration
  belongs_to :user
end
