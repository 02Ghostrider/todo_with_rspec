class AddUserIdAndDueDateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :user_id, :integer
  end
end
