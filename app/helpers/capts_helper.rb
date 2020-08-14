# frozen_string_literal: true
module CaptsHelper # rubocop:todo Style/Documentation 
def user_info
    render partial: 'capts/user_info' if user_signed_in?
end

def new_user_info
    render partial: 'capts/user_info' if user_signed_in? && current_user.id == capt.user_id
end

def user_info_profile

if user_signed_in?
    render 'profile'
else
render 'trends'
end
end

def flash_notice
    if flash[:notice]

    render partial: 'if_flash_notice' 
else
    render partial: 'else_flash_notice'
end
end

def flash_alert
    render partial: 'flash_alert' if flash[:alert]
end

def user_informer
    render partial: 'else_flash_notice' if user_signed_in?
end

def object(f)
    render partial: 'object', f: f if f.object.errors[:base].present? 
end

def flash_signed_in
    render partial: 'flash_signed_in' if user_signed_in?
end
end
