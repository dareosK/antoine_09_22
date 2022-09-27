class DropBodyFromWriting < ActiveRecord::Migration[7.0]
  def change
    remove_column :writings, :body
  end
end
