class Project < ApplicationRecord

    belongs_to :team
    belongs_to :user

    #allows user to select and assign to the different team
    accept_nested_attributes_for :team
end