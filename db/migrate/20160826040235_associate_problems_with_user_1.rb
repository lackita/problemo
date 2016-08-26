class AssociateProblemsWithUser1 < ActiveRecord::Migration[5.0]
  def change
    user = User.find_by_id(1)
    Problem.all.each do |p|
      p.user = user
      p.save!
    end
  end
end
