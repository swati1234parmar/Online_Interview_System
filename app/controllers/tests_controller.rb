class TestsController < ApplicationController
 before_action :set_test, only: [:start_test, :paper, :submit, :result]
  
  def paper
    @questions = @test.questions.page(params[:page]).per_page(1)
    @answers = @questions.first.answers.where(user_id: current_user.id, test_id: @test)
    @answer = @questions.first.answers.new
  end

  def start_test
 
  end

  def submit

    @test = Test.find(params[:id])
    @user = current_user.id
    Answer.where(user_id:current_user.id,question_id:answer_paper_params[:question_id],test_id:params[:id]).destroy_all
    @answer = @test.answers.new(answer_paper_params)
    @answer.user_id = @user
    @answer.save
    @ans_maq = @answer.options.map(& :is_correct)
      if @ans_maq.size == 1   
        if @ans_maq.include?(false)       
         @answer.score = 0
        else
         @answer.score = 1 
        end
     else
      if @ans_maq.include?(false)
         @answer.score = 0
      else
         @answer.score = 1
      end
    end
    @answer.save
  end
   
  def score
    @test=Test.find(params[:id])
    @score = Answer.where(user_id:current_user.id, test_id:@test)
    @result=Result.new
    render "score"
  end

  def result
   @result=Result.where(user_id: current_user.id)
  end

  def undef
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def answer_paper_params
      params.require(:answer).permit(:score, :user_id, :test_id, :question_id, :option_ids=>[])
    end

    def test_params
      params.require(:test).permit(:question_id, :name, :duration, question_ids: [])
    end
end
