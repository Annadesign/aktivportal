class AddSortorderToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :sortorder, :integer
  end
end
