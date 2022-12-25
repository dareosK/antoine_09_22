class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tagline
      t.text :text
      t.string :institution_name
      t.string :institution_address
      t.date :start_date
      t.date :end_date
      t.string :artists

      t.timestamps
    end
  end
end
