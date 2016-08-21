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
  end
end
