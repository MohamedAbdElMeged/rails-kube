class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :action
      t.string :actor
      t.string :domain
      t.datetime :time_stamp
      t.timestamps
    end
  end
end
