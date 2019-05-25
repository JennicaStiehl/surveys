class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references            :choice
      t.string                    :student_id
      t.integer                  :course_id
      t.string                    :answer_type
      t.string                    :text_answer
      t.timestamps
      t.references            :question, index: true
    end
  end
end
