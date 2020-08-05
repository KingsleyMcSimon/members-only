# frozen_string_literal: true

module CaptsHelper # rubocop:todo Style/Documentation
def user_info
    render partial: 'capts/_user_info', if user_signed_in?
end

def new_user_info
    render partial: 'capts/_user_info', if user_signed_in? && current_user.id == capt.user_id
end

def user_info_profile

if user_signed_in?

# render partial: 'trends'

render 'profile'
 else
 render 'trends'
end
end

def flash_notice
    render partial: '_flash_notice', if flash[:notice]
end

def flash_alert
    render partial: '_flash_notice', if flash[:alert]
end

def user_informer
    render partial: '_flash_notice', if user_signed_in?
end

def object
    render 'object', f.error_notification message: f.object.errors[:base].to_sentence if f.object.errors[:base].present? 
end

end
