class AddIsRequiredToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :is_required, :boolean, default: false
  end
end
