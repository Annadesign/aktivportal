class AddStartToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
  end
end
