class ProblemsController < ApplicationController
  def create
    if params[:problem][:description]
      user = User.find(params[:problem][:user_id])
      problem = user.problems.new(params.require(:problem).permit(:description))
      problem.save!
    end
    redirect_to '/'
  end

  def solve
    Problem.find(params[:id]).solve
    redirect_to '/'
  end
end
