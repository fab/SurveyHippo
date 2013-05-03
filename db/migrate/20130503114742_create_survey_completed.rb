class CreateSurveyCompleted < ActiveRecord::Migration
  def change
    create_table :survey_completed do |t|
      t.references :survey
      t.references :user
      t.boolean    :completed
    end
  end
end
