class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :workunits, :foreign_key => "performed_by_user_id"
  has_and_belongs_to_many :projects, :join_table => "project_admins" 
end
