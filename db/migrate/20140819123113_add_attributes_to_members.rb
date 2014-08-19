class AddAttributesToMembers < ActiveRecord::Migration
  def change
    add_column :members, :summary,   :text
    add_column :members, :name,      :string
    add_column :members, :last_name, :string
  end
end
