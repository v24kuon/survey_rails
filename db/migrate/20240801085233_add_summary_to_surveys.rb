class AddSummaryToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :summary, :text
  end
end
