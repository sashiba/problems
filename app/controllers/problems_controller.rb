class ProblemsController < ApplicationController
  before_action :require_login

  def index
    @problems = current_user.current_problems
  end

  def show
    @problem = Problem.find(params[:id])
  end
end
