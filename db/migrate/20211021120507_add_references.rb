class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :resumes, :user, null: false, foreign_key: true
    add_reference :skillstools, :resume, null: false, foreign_key: true
    add_reference :experiences, :resume, null: false, foreign_key: true
    add_reference :educations, :resume, null: false, foreign_key: true
    add_reference :publications, :experience, null: false, foreign_key: true
  end
end
