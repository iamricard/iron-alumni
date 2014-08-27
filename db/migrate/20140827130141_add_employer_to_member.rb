class AddEmployerToMember < ActiveRecord::Migration
  def change
    add_column :members, :employer, :string
  end
end
