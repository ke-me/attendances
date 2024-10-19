class CreateWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :works do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :work_hours
      t.string :status

      t.timestamps
    end
  end
end
