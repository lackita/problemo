class ProblemsController < ApplicationController
  def create
    if params[:problem][:description]
      user = User.find(session[:user_id])
      problem = user.problems.new(params.require(:problem).permit(:description, :focus))
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
      p.focus = true
      p.save!
    end
    redirect_to request.referer
  end

  def unfocus
    p = Problem.find(params[:id])
    p.focus = false
    p.save!
    redirect_to request.referer
  end
end
