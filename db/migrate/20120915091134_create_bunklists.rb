class CreateBunklists < ActiveRecord::Migration
  def change
    create_table :bunklists do |t|
      t.string :date
      t.integer :schedule_id
      t.integer :fbuser_id

      t.timestamps
    end
  end
end
