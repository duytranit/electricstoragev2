class RegistrationsController < Devise::RegistrationsController

	private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation, :status, :role, :avatar,
    	:avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name,:email, :password, :password_confirmation,
    	:current_password, :status, :role, :avatar, :avatar_file_name, :avatar_content_type,
    	:avatar_file_size, :avatar_updated_at)
  end
end
