class CreateTimesheets < ActiveRecord::Migration[6.0]
  def change
    create_table :timesheets do |t|
      t.date :date
      t.float :hours

      t.timestamps
    end
  end
end
