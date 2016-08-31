class ProblemsController < ApplicationController
  def create
    if params[:problem][:description]
      user = User.find(session[:user_id])
      problem = user.problems.new(params.require(:problem).permit(:description, :focused))
      problem.save!
    end
    redirect_to request.referer
  end

  def solve
    p = Problem.find(params[:id])
    if p.user.id == session[:user_id].to_i
      p.solve
    end
    redirect_to request.referer
  end

  def focus
    p = Problem.find(params[:id])
    if p.user.id == session[:user_id].to_i
      p.focused = true
      p.save!
    end
    redirect_to request.referer
  end

  def unfocus
    p = Problem.find(params[:id])
    if p.user.id == session[:user_id].to_i
      p.focused = false
      p.save!
    end
    redirect_to request.referer
  end
end
