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
    
    if(hours < Constant.required_hours) 
      return 0
    else
      hours = hours - Constant.required_hours 
      
      reduction_level = (hours/Constant.reduction_step_size).floor
      
      unless reduction_level > Constant.max_reduction_level
        return reduction_level * Constant.reduction_per_step
      else 
        return (Constant.max_reduction_level+1) * Constant.reduction_per_step
      end
      
    end
  end
  
  def flight_hour_price
    return Constant.base_flight_hour_price - self.flight_price_reduction
  end
  
  def missing_hours
    hours = self.total_hours(true).to_i
    if hours < Constant.required_hours 
      return (Constant.required_hours-hours)
    else 
      return 0
    end
  end
  
  def penalty_payments
    
    return self.missing_hours*Constant.penalty_per_missing_hour
  end
end
