class Timesheet < ApplicationRecord
   belongs_to :user
   belongs_to :project, optional: true

   accepts_nested_attributes_for :project

   include PublicActivity::Model 
   tracked owner: Proc.new { |controller, model| controller.current_user }
  
    
end
