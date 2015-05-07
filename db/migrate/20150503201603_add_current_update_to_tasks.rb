class AddCurrentUpdateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :current_update, :string
  end
end
