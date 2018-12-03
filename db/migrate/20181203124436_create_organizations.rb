class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :contactperson
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
