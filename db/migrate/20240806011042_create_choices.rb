class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :question, null: false, foreign_key: true
      t.string :choice_text
      t.integer :order_number

      t.timestamps
    end
  end
end
