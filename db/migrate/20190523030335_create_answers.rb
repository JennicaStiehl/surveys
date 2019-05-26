class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references  :response, index: true
      t.text             :answer

      t.timestamps
    end
  end
end
