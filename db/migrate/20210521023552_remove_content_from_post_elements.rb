class RemoveContentFromPostElements < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_elements, :content
  end
end
