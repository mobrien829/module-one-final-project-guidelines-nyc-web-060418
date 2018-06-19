class CreateLikedshows < ActiveRecord::Migration[5.1]
  def change
    create_table :liked_shows do |t|
      t.integer :user_id
      t.integer :show_id
      t.boolean :polarity
    end
  end
end
