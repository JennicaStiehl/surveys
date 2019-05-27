class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer                  :joins_id
      t.string                    :student_id
      t.integer                  :course_id
      t.string                    :joins_table
      t.timestamps
      t.references            :question, index: true
    end
  end
end
