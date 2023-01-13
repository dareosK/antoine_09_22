class AddSlugToWritings < ActiveRecord::Migration[7.0]
  def change
    add_column :writings, :slug, :string
    add_index :writings, :slug, unique: true
  end
end
