class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references            :question
      t.references            :answer
      t.integer                  :student_id
      t.integer                  :class_id
      t.integer                  :present
      t.timestamps
    end
  end
end
