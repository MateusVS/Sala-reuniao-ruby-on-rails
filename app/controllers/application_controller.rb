class ApplicationController < ActionController::Base

    include SessionsHelper

    private
        def require_logged_in_user
            if !user_signed_in?
                flash[:danger] = 'Área Restrita. Por favor, realize o login'
                redirect_to new_user_path
            end
        end
end
