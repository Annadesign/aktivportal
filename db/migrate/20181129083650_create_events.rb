class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.datetime :date
      t.string :lng
      t.string :lat
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
