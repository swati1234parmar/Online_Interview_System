class Admin::TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
    def index
      @tests = Test.all
      @result = Result.all
    end
    def show
    end
    def new
      @test = Test.new
    end
    def edit

    end
    def user
      # user_id = Result.all.map(&:user_id)
      # @users = user_id.map{|user| User.where(id:user)}.flatten
      user_id = Result.all.map(&:user_id).uniq
      @users = user_id.map{|user| User.find(user)}
    end
    def user_result
      user=User.find(params[:id])
      @result=user.results
    end
    def create
      @test = Test.new(test_params)
       respond_to do |format|
        if @test.save
          format.html { redirect_to @test, notice: 'Test was successfully created.' }
          format.json { render :show, status: :created, location: @test }
        else
          format.html { render :new }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end
    end
    def update
      respond_to do |format|
        if @test.update(test_params)
          format.html { redirect_to  admin_tests_path, notice: 'Test was successfully updated.' }
          format.json { render :show, status: :ok, location: @test }
        else
          format.html { render :edit }
          format.json { render json: @test.errors, status: :unprocessable_entity }
        end
      end
    end
    def destroy
      @test.destroy
      respond_to do |format|
        format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
    @test = Test.find(params[:id])
    end
    def test_params
      params.require(:test).permit(:question_id, :name, :duration, question_ids: [])
    end
end
