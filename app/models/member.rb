class Member < ActiveRecord::Base
  has_many :member_course_relations
  has_many :courses, through: :member_course_relations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
end
