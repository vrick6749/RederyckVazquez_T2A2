class RemovePriceFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :price, :float
  end
end
