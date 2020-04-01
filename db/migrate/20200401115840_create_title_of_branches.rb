class CreateTitleOfBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :title_of_branches do |t|
      t.string :name
      t.timestamps
    end
  end
end
