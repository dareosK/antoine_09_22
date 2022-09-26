class CreateWritings < ActiveRecord::Migration[7.0]
  def change
    create_table :writings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.datetime :date
      t.string :tagline
      t.string :type

      t.timestamps
    end
  end
end
