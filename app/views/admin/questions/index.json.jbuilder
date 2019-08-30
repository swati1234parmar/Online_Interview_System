json.array! @questions, partial: "questions/question", as: :question
json.array! @questions, partial: "questions/question_type", as: :question_type

