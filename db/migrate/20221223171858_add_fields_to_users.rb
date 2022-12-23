class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :quotes, :text
    add_column :users, :contact_mail, :string
  end
end
