class CreateMembersCourses < ActiveRecord::Migration
  def change
    create_table :member_course_relations, id: false do |t|
      t.belongs_to :member
      t.belongs_to :course
    end
  end
end
