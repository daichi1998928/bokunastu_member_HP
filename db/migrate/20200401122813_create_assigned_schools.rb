class CreateAssignedSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :assigned_schools do |t|
      t.string :name
      t.timestamps
    end
  end
end
