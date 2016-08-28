module ApplicationHelper
  def toggle_focus_path(problem)
    if problem.focus
      unfocus_problem_path(problem)
    else
      focus_problem_path(problem)
    end
  end
end
