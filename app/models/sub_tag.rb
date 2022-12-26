class SubTag < Tag
  belongs_to :tag, class_name: 'Tag', foreign_key: 'tag_id'
  validates :tag_id, presence: true
end
