class HypothesesController < ApplicationController
  def create
    if params[:hypothesis][:description]
      problem = Problem.find(params[:hypothesis][:problem_id])
      hypothesis = problem.hypotheses.new(params.require(:hypothesis).permit(:description))
      hypothesis.save!
    end
    redirect_to "/"
  end
end
