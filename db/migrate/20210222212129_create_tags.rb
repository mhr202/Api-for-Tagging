class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :type
      t.integer :tag_id

      t.timestamps
    end

    add_index :tags, :tag_id
  end
end
