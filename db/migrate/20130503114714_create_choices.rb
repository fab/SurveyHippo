class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :question
      t.text       :choice, :null => false
      t.integer    :counter_cache, :null => false, :default => 0
    end
  end
end
