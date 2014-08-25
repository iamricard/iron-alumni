class Role < ActiveRecord::Base
  has_many :member_roles
  has_many :users, through: :member_roles
  validates :role_name, inclusion: {
    in: %w(admin student), message: '%{value} is not a registered role, please check role.rb'
  }
end
