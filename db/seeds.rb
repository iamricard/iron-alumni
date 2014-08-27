if Rails.env == 'development'
  puts 'Cleaning DB first ...'
  Member.destroy_all
  Course.destroy_all
  Role.destroy_all
end

puts 'Creating Admin ...'
admin_member = Member.create!(name: 'ricard',
                              last_name: 'sole casas',
                              email: 'ricard.solecasas@gmail.com',
                              password: '12345678',
                              confirmed_at: Time.now)
admin_member.add_roles(%w(admin student))

COURSES_PROPERTIES = {
  cities: ['barcelona', 'madrid', 'miami'],
  amount: 5,
  course_types: ['web', 'mobile']
}

courses = []

puts "Creating #{COURSES_PROPERTIES[:amount]} Courses ..."
COURSES_PROPERTIES[:amount].times do
  start_date = Time.now + Random.rand(12).months
  end_date   = start_date + 2.months
  courses << Course.create!(city: COURSES_PROPERTIES[:cities].sample,
                            course_type: COURSES_PROPERTIES[:course_types].sample,
                            start_date: start_date, end_date: end_date)
end

USERS = 100
puts "Creating #{USERS} Users ..."
USERS.times do
  STATES = [Time.now]
  member = Member.create!(name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.free_email,
                          password: Faker::Internet.password,
                          confirmed_at: STATES.sample,
                          summary: Faker::Lorem.paragraphs(3).join("\n"),
                          employer: Faker::Company.name)
  member.add_roles(%w(student))
  courses.sample.members << member
end
