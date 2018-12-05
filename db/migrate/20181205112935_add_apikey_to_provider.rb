class AddApikeyToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :apikey, :string
  end
end
