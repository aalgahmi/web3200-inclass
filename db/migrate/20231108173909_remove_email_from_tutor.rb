class RemoveEmailFromTutor < ActiveRecord::Migration[7.0]
  def change
    remove_column :tutors, :email
  end
end
