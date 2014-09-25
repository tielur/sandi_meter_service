class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
    add_index :users, [:provider, :name], name: "index_users_on_provider_and_name", unique: true
  end
end
