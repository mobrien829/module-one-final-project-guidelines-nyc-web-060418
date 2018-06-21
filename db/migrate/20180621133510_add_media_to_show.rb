class AddMediaToShow < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :media, :string
  end
end
