class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :workunits, :foreign_key => "performed_by_user_id"
  has_and_belongs_to_many :projects, :join_table => "project_admins" 
  
  def total_hours(confirmed) 
    hours = self.workunits.select{|w| w.confirmed == confirmed}.map{|w| w.duration}.reduce(:+)
    unless hours.nil?
      return hours
    else
      return 0
    end
  end
  
  def workunits_to_confirm
    workunits = self.projects.map{|p| p.workunits.reject{|w| w.confirmed }}.flatten
  end
  
  def flight_price_reduction
    hours = self.total_hours(true).to_i
    
    if(hours < 30) 
      return 0
    else
      hours = hours - 30 
      
      reduction_level = (hours/15).floor
      
      unless reduction_level > 10
        return reduction_level * 1.5
      else 
        return 11 * 1.5
      end
      
    end
  end
  
  def flight_hour_price
    return 22.20 - self.flight_price_reduction
  end
  
  def missing_hours
    hours = self.total_hours(true).to_i
    if hours < 30 
      return (30-hours)
    else 
      return 0
    end
  end
  
  def penalty_payments
    
    return self.missing_hours*20
  end
end
