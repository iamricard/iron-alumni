class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   :type,       null: false, default: 'web'
      t.datetime :start_date, null: false, default: Time.now
      t.datetime :end_date,   null: false, default: Time.now + 2.months
      t.string   :city,       null: false, default: 'barcelona'

      t.timestamps
    end
  end
end
