class TurnStartingDateToDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :start_date, :date
  end
end
