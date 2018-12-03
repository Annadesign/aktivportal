class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.string :image
      t.boolean :publish
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
