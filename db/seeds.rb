if Rails.env == "development"
  puts "Cleaning DB first ..."
  Member.destroy_all
  Course.destroy_all
  Role.destroy_all
end

puts 'Creating Admin ...'
admin_member = Member.create!(name: 'ricard',
              last_name: 'sole casas',
              email: "ricard.solecasas@gmail.com",
              password: "12345678",
              confirmed_at: Time.now)
admin_member.add_roles(['admin', 'student'])
