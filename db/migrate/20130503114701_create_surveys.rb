class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :survey do |t|
      t.references :user
      t.string     :name
      t.integer    :counter_cache
    end
  end
end
