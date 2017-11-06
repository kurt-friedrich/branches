class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string  :name,       null: false
      t.boolean :is_active
      t.integer :company_id, null: false

      t.timestamps
    end

    add_index :lessons, :company_id
  end
end
