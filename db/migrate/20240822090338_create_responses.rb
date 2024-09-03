class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true
      t.json :answers
      t.string :status, default: 'in_progress'
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end

    add_index :responses, [:user_id, :survey_id], unique: true
  end
end
