class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :usuario, foreign_key: true
      t.datetime :leccion1
      t.datetime :leccion2
      t.datetime :leccion3
      t.datetime :leccion4
      t.datetime :leccion5

      t.timestamps
    end
  end
end
