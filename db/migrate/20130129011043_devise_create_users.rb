class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :full_name
      t.string :image
      t.string :location
      t.string :nickname
      t.string :urls

      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end
