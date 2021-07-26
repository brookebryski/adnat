class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :sid
      t.datetime :start
      t.datetime :finish
      t.integer :break
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
