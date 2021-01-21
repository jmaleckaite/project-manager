class Timesheet < ApplicationRecord
   belongs_to :user
   belongs_to :project, optional: true

   accepts_nested_attributes_for :project

   include PublicActivity::Model 
   tracked owner: Proc.new { |controller, model| controller.current_user }

   def self.all_users
      find_by_sql("SELECT user_id FROM timesheeets GROUP BY project_id").map(&:user_id).select {|x| x}
   end

   def self.select(user_id)
      if user_id
         find_all_by_user(user_id)
      else
         find :all
      end
   end



  
    
end
