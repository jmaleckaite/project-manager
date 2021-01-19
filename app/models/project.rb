class Project < ApplicationRecord

    belongs_to :team
    belongs_to :user

    #allows user to select and assign to the different team
    accepts_nested_attributes_for :team

    include PublicActivity::Model
    tracked owner: Proc.new { |controller, model| controller.current_user }

end
