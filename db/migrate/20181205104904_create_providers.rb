class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :title
      t.string :apiurl

      t.timestamps
    end
  end
end
