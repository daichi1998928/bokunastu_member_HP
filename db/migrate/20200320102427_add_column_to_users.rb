class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :faculty, :string
    add_column :users, :history, :text
    add_column :users, :vision, :text
    add_column :users, :mission, :text
    add_column :users, :birthplace, :text
    add_column :users, :dream, :text
    add_column :users, :objective, :text
    add_column :users, :back_ground, :text
    add_column :users, :episode, :text
    add_column :users, :changing, :text
  end
end
