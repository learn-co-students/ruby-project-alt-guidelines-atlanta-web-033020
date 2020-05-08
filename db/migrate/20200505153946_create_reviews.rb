class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :student    ## t.integer :student_id, foreign_key => true
      t.references :story      ## t.integer :story_id, foreign_key => true
      t.text :comment
    end
  end
end
