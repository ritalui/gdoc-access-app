class RemoveFiletextFromSubmittedWorks < ActiveRecord::Migration
  def change 
    remove_column :submitted_works, :file_text
  end
end
