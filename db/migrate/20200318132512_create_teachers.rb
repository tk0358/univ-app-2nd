class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
