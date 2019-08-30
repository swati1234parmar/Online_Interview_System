class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  has_many :test_questions , dependent: :destroy
  has_many :tests , through: :test_questions
  has_many :answers , dependent: :destroy
  validates :question, :question_type, presence: true
end