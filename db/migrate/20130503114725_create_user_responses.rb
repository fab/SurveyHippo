class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses, :id => false do |t|
      t.references :user
      t.references :question
      t.references :choice
    end
    add_index :user_responses, [:question_id, :user_id], :unique => true
  end
end
