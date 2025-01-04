class CreateClassrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :classrooms do |t|
      t.integer :number, null: false
      t.string :name

      t.timestamps
    end
  end
end
