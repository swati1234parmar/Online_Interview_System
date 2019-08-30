class AddColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
  	add_column :questions, :question_type, :string
  	 # remove_foreign_key :options, :test_questions
  end
end
