class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.references :topic, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
