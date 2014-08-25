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
    @role_names ||= roles.map { |role| role.role_name }
  end

  def add_roles(roles)
    roles.each do |role|
      self.roles << Role.find_or_create_by!(role_name: role)
    end
  end

  def self.find_or_create(email, password = generate_password)
    member = find_by(email: email)
    if member.nil?
      member = create(email: email, password: password)
    end
    member
  end

  private

  def self.generate_password
    generated_password = '12345678' # Devise.friendly_token.first(8)
  end
end
