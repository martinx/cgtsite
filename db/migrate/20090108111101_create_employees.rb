class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table "employees", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :reset_password_code,       :string
      
      
    end
  end

  def self.down
    drop_table "employees"
  end
end
