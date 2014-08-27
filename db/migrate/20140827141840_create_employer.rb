class CreateEmployer < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name

      t.timestamps
    end
  end
end
