class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text            :question
      t.references :category, index: true

      t.timestamps
    end
  end
end
