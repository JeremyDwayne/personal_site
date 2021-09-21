class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.string :title
      t.string :source
      t.text :code

      t.timestamps
    end
  end
end
