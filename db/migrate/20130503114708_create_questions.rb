class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :question do |t|
      t.references :survey
      t.text       :question
      t.integer    :counter_cache
    end
  end
end
