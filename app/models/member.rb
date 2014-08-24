class Member < ActiveRecord::Base
  include Filterable

  has_many :member_course_relations
  has_many :courses, -> { distinct }, through: :member_course_relations
  has_many :member_roles
  has_many :roles, -> { distinct }, through: :member_roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  scope :email, -> (email) { where email: email }

  def has_role?(role)
    role_names.include? role
  end

  def role_names
    @role_names ||= self.roles.map(&:map)
  end

  def role=(role)
    self.roles << Role.find_or_create_by_name(role)
  end
end
