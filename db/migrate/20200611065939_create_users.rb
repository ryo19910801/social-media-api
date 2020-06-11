class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :self_introduction
      t.string :website_url
      t.string :avatar
      t.string :auth_token, null: false

      t.timestamps

      t.index :auth_token, unique: true
    end
  end
end
