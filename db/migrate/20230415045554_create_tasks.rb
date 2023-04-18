class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :is_all_day
      t.text :memo
      t.string :title

      t.timestamps
    end
  end
end
