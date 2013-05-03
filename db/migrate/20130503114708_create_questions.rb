class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey
      t.text       :question, :null => false
      t.integer    :counter_cache, :null => false, :default => 0
    end
  end
end
