class QuestionsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(theme: question_params[:theme], user_id: current_user.id)
  end

  def destroy
    question = Question.find(params[:id])
    question.delete
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


  private
  def question_params
    params.require(:question).permit(:theme)
  end


end
