module AnswerHelper
	def is_check(answers, option_id)
        return false if answers.blank?
        	answers.each do |answer|
           		answer.options.each do |check|
           		return check.id == option_id
       		end
        end
    end	
    
end
