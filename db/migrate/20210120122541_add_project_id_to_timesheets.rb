class AddProjectIdToTimesheets < ActiveRecord::Migration[6.0]
  def change
    add_column :timesheets, :project_id, :integer
  end
end
