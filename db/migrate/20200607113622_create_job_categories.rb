class CreateJobCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :job_categories do |t|
      t.string :name
      t.integer :sequence
      t.timestamps
    end
  end
end
