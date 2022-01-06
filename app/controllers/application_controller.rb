class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user.teams.exists?
      if Month.where(team_id: (current_user.teams.pluck(:id))).exists?
        month = Month.where(team_id: (current_user.teams.pluck(:id))).order(created_at: :desc).first
        month_path(month)
      else
        teams_path
      end
    else
      new_team_path
    end
  end
end
