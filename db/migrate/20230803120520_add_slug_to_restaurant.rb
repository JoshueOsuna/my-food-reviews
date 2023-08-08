class AddSlugToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :slug, :string
  end
end
