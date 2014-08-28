class Member < ActiveRecord::Base
  include Filterable

  has_many :member_course_relations
  has_many :courses, -> { distinct }, through: :member_course_relations
  has_many :member_roles
  has_many :roles, -> { distinct }, through: :member_roles
  belongs_to :employer

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  scope :email, -> (email) { where email: email }

  # need to create a scope that filters alumni, but I give up for now
  def alumni?
    courses.count > 0
  end

  def role?(role)
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

  def self.find_or_create(opts)
    opts[:password] ||= generate_password
    member = find_by(email: opts[:email])
    member = create!(email: opts[:email], password: opts[:password]) if member.nil?
    member
  end

  def self.generate_password
    '12345678' # Devise.friendly_token.first(8)
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

end
