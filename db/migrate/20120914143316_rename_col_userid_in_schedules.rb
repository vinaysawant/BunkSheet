class RenameColUseridInSchedules < ActiveRecord::Migration
  def up
		rename_column :schedules,:user_id,:fbuser_id
  end

  def down
  end
end
