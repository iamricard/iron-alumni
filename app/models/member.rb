class Member < ActiveRecord::Base
  include Filterable

  has_many :member_course_relations
  has_many :courses, -> { distinct }, through: :member_course_relations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  scope :email, -> (email) { where email: email }
end
