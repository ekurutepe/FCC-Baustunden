class Workunit < ActiveRecord::Base
  belongs_to :performed_by, :class_name => "User", :foreign_key => "performed_by_user_id"
  belongs_to :confirmed_by, :class_name => "User", :foreign_key => "confirmed_by_user_id"
  belongs_to :project
  
  validates :performed_by, presence: true
  validates :project, presence: true
  
  # validates :confirmed_by, inclusion: { in: ->(workunit) {workunit.project.admins}}
  
  def confirmed 
    return !confirmed_at.nil?
  end
  
end
