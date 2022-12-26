class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :title, null: false
      t.string :purpose
      t.string :duration, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
