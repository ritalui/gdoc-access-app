class CreateSubmittedWorks < ActiveRecord::Migration
  def change
    create_table :submitted_works do |t|
      t.integer :user_id
      t.integer :assignment_id
      t.string :file_name
      t.text :file_text
      t.string :submitted_link
      t.string :provider
      t.integer :reviewer_id
      t.text :review_comments

      t.timestamps
    end
  end
end
