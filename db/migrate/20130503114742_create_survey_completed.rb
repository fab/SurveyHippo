class CreateSurveyCompleted < ActiveRecord::Migration
  def change
    create_table :survey_completed, :id => false do |t|
      t.references :survey
      t.references :user
      t.boolean    :completed
    end
    add_index :survey_completed, [:survey_id, :user_id], :unique => true
  end
end
