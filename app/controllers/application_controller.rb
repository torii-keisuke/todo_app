class ApplicationController < ActionController::Base
end

def after_sign_out_path_for(resources)
  new_user_session_path root_path
end

def after_sign_up_path_for(resources)
  mypage_root_path root_path
end
