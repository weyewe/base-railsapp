class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string, default: ""
    add_index :users, :auth_token, unique: true
    
    add_column :users, :role_id, :integer
    add_column :users, :is_main_user, :boolean, :default => false
  end
end
