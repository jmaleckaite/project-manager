class Team < ApplicationRecord
    #if team is deleted, the project is deleted as well
    has_many :projects, dependent: :destroy
    has_many :users
    
    accepts_nested_attributes_for :user, allow_destroy: true

end
