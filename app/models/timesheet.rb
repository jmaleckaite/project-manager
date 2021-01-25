class Timesheet < ApplicationRecord
   belongs_to :user
   belongs_to :project, optional: true

   accepts_nested_attributes_for :project

   include PublicActivity::Model 
   tracked owner: Proc.new { |controller, model| controller.current_user }

   def self.search(search)
      if search
          user = User.find_by(name: search)
          if user
              self.where(user_id: user)
          else
              Timesheet.all
          end
      else
          Timesheet.all
      end
  end


end



  
    
