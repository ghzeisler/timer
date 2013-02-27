class AddTimeZoneTasks < ActiveRecord::Migration
  def up
  	add_column :tasks, :time_zone, :string
  end

  def down
  	remoive_column :tasks, :time_zone
  end
end
