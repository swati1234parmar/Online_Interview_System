class Test < ApplicationRecord
	has_many :test_questions, dependent: :destroy
	has_many :questions, through: :test_questions 
	has_many :answers , dependent: :destroy
	has_many :results , dependent: :destroy
	validates :name , :duration, :questions, presence: true
end
