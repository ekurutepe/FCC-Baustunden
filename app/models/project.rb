class Project < ActiveRecord::Base
  has_and_belongs_to_many :admins, :class_name => "User", :join_table => "project_admins", inverse_of: :projects
  has_many :workunits
  
  validates :admins, presence: true
  
  def total_hours 
    return self.workunits.reject{|w| !w.confirmed}.map{|w| w.duration}.reduce(:+)
  end
  
  def admin_names
    names = self.admins.map{|a| a.email}
    return names.join(", ")
  end
  

end
