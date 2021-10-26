class AddColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :title, :string
    add_column :products, :category, :string
    add_column :products, :sale_item, :string
    add_column :products, :t_c_accepted, :boolean
  end
end
