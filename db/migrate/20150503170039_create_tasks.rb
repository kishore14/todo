class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :actions, :history, :final_notes
      t.integer :user_id, :status_id
      t.timestamps
    end
  end
end
