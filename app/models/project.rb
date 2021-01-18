class Project < ApplicationRecord

    belongs_to :team
    belongs_to :user

    #allows user to select and assign to the different team
    accepts_nested_attributes_for :team
end
