class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions, :id => false do |t|
      t.references :survey
      t.references :user
      t.boolean    :completed, :default => false
    end
    add_index :completions, [:survey_id, :user_id], :unique => true
  end
end
