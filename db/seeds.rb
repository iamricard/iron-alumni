if Rails.env == "development"
  puts "Cleaning DB first ..."
  Member.destroy_all
end

puts "Creating Users ..."
Member.create!(name: 'ana',
              last_name: 'example',
              email: "ana@example.com",
              password: "12345678",
              confirmed_at: Time.now)
Member.create!(name: 'bella',
              last_name: 'example',
              email: "bella@example.com",
              password: "12345678",
              confirmed_at: Time.now)
Member.create!(name: 'clara',
              last_name: 'claret',
              email: "clara@example.com",
              password: "12345678",
              confirmed_at: Time.now)
Member.create!(name: 'dora',
              last_name: 'explorer',
              email: "dora@example.com",
              password: "12345678",
              confirmed_at: Time.now)
Member.create!(name: 'ricard',
              last_name: 'sole casas',
              email: "ricard.solecasas@gmail.com",
              password: "12345678",
              confirmed_at: Time.now)
Member.create!(name: 'elena',
              last_name: 'torro',
              email: "elenatorro@gmail.com",
              password: "12345678",
              confirmed_at: Time.now)
