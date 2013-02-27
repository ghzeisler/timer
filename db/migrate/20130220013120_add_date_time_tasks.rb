class AddDateTimeTasks < ActiveRecord::Migration
  def up
  	add_column :tasks, :date_time, :datetime
  end

  def down
  	remove_column :tasks, :date_time
  end
end
