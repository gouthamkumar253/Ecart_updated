# Registration Confirmation for user
class ConfirmationsController < Devise::ConfirmationsController
  def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
        
      else
        new_session_path(resource_name)
      end
    end

end