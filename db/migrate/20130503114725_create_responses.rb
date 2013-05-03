class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user
      t.references :question
      t.references :choice
    end
    add_index :responses, [:question_id, :user_id], :unique => true
  end
end
