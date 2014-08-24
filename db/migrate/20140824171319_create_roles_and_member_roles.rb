class CreateRolesAndMemberRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_name
    end

    create_table :member_roles do |t|
      t.belongs_to :member
      t.belongs_to :role
    end
  end
end
