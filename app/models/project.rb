class Project < ActiveRecord::Base
  has_and_belongs_to_many :admins, :class_name => "User", :join_table => "project_admins", inverse_of: :projects
  has_many :workunits
  
  validates :admins, presence: true
end
