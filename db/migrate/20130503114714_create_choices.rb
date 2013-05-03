class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choice do |t|
      t.references :question
      t.text       :choices, :null => false
      t.integer    :counter_cache, :null => false, :default => 0
    end
  end
end
