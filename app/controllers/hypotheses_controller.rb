class HypothesesController < ApplicationController
  def create
    problem = Problem.find(params[:hypothesis][:problem_id])
    if params[:hypothesis][:description] and problem.user.id.to_s == session[:user_id].to_s
      hypothesis = problem.hypotheses.new(params.require(:hypothesis).permit(:description))
      hypothesis.save!
    end
    redirect_to request.referer
  end
end
