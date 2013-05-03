class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choice do |t|
      t.references :question
      t.text       :choices
      t.integer    :counter_cache
    end
  end
end
