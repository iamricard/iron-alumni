class AddEmployerToMember < ActiveRecord::Migration
  def change
    add_column :members, :employer_id, :integer
  end
end
