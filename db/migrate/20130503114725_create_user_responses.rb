class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.references :user
      t.references :question
      t.references :choice
    end
  end
end
