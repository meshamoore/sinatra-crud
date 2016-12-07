class CreateMoviesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rating
    end
  end
end