class Timesheet < ApplicationRecord
   belongs_to :user
   belongs_to :project, optional: true

   accepts_nested_attributes_for :project

   include PublicActivity::Model 
   tracked owner: Proc.new { |controller, model| controller.current_user }

  def self.search(search)
   if search
      timesheets = Timesheet.all
      timesheets = Timesheets.where(date: search[:":date"][","])
      return timesheets
   else
      Timesheet.all
   end
end



  
    
end
