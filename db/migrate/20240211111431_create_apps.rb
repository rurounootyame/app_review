class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :app_image_id

      t.timestamps
    end
  end
end
