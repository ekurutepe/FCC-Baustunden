class Constant
  def self.base_flight_hour_price
    return 22.20
  end

  def self.required_hours
    return 30
  end
  
  def self.max_reduction_level
    return 10
  end
  
  def self.reduction_per_step
    return 1.50
  end
  
  def self.reduction_step_size
    return 15
  end
  
  def self.penalty_per_missing_hour
    return 20
  end
  
end