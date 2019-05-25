class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.references :question, index: true
      t.text             :choice
      t.boolean      :correct
      t.timestamps
    end
  end
end
