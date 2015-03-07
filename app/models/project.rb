class Project < ActiveRecord::Base
  has_and_belongs_to_many :admins, :class_name => "User", :join_table => "project_admins", inverse_of: :projects
  has_many :workunits
  
  validates :admins, presence: true
  
  def total_hours 
    unless self.workunits.count == 0
      hours = self.workunits.reject{|w| !w.confirmed}.map{|w| w.duration}.reduce(:+)
      
      unless hours.nil?
        return hours
      else
        return 0
      end
    else 
      return 0
    end
  end
  
  def admin_names
    names = self.admins.map{|a| a.email}
    return names.join(", ")
  end
  

end
