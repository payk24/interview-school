class CreateSections < ActiveRecord::Migration[8.0]
  def change
    create_table :sections do |t|
      t.references :teacher_subject, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
