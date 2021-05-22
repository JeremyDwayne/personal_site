class RenamePostElements < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_elements, :elements
  end
end
