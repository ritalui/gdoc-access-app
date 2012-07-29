class UserTasksController < ApplicationController
  def index
    if current_user 
      @user_tasks = SubmittedWork.where("user_id = ?", current_user.id)
      @assignment = Assignment.find_by_id(@user_tasks[0][:assignment_id])
      @auths = ProviderAuth.find_all_by_user_id(current_user.id)
    end
  end
end
