class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :author
      t.string     :name, :null => false
      t.integer    :counter_cache, :null => false, :default => 0
      t.timestamps
    end
  end
end
