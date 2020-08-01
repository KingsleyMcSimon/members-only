# frozen_string_literal: true

module CaptsHelper # rubocop:todo Style/Documentation
     def user_info
    render partial: 'user_info' if user_sign_in?
  end

def user_signed_in
    render partial: 'user_info' if user_signed_in? && current_user.id == capt.user_id
end

def signed_in
if user_signed_in?
  render partial: 'trends'
render 'profile'
 else
 render 'trends'
end
end

def password_length
  render 'password_length'  if @minimum_password_length
end

def devise_mapping
  render 'devise_mapping' if devise_mapping.confirmable? && resource.pending_reconfirmation?
end

def minimum_password
  render 'minimum_password' if @minimum_password_length
end

def remember_me
  render 'remember_me' if devise_mapping.rememberable?
end

def resource_errors
  render partial: 'resource_errors' if resource.errors.any?
end

def controller_name
  render 'controller_name' if controller_name != 'sessions'
end

def registerable
  render 'registerable' if devise_mapping.registerable? && controller_name != 'registrations'
end

def recoverable
  render 'recoverable' if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
end

def confirmable
  render 'confirmable'  if devise_mapping.confirmable? && controller_name != 'confirmations'
end

def lockable
  render 'lockable'  if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
end

def omniauthable
  render 'omniauthable' if devise_mapping.omniauthable?
end

def body_flash
  render partial: 'body_flash' if flash[:notice] 
end

def user_logged_in
  render partial: 'user_logged_in' if user_signed_in?
end

def object_errors
  render 'object_errors' if f.object.errors[:base].present?
end

end
