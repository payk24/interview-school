class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.references :classroom, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.time :start_at
      t.time :end_at
      t.string :days_of_week, array: true, default: []

      t.timestamps
    end
    add_index :sections, :days_of_week, using: 'gin'
  end
end
