class ProblemsController < ApplicationController
  def show
    @problem = Problem.order("RANDOM()").first
    if not @problem
      @problem = Problem.new
    end
  end

  def new
    @problem = Problem.new
  end

  def index
    @problems = Problem.all
  end

  def create
    problem = Problem.new(params.require(:problem).permit(:description))
    problem.save
    redirect_to '/'
  end

  def solve
    Problem.find(params[:id]).update(solved: true)
    redirect_to '/'
  end
end
