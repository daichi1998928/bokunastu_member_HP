class AddFkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :university_branch_id , :integer
    add_column :users, :title_of_branch_id , :integer
    add_column :users, :university_id , :integer
    add_column :users, :grade_id , :integer
    add_column :users, :assigned_school_id, :integer

  end
end
