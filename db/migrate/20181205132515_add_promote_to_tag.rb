class AddPromoteToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :promote, :boolean
  end
end
