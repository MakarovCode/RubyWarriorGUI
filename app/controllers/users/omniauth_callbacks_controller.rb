class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
            sign_in @user, :event => :authentication #this will throw if @user is not activated
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
            actual = session[:actual_url]
            if !actual.nil?        
                redirect_to(actual) 
            else 
                redirect_to tutorials_path
            end
        else
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_session_url
        end
    end

    def google_oauth2

        @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

        if @user.persisted?
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
            sign_in @user, :event => :authentication
            # set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
            actual = session[:actual_url]
            if !actual.nil?        
                redirect_to(actual)
            else 
                redirect_to tutorials_path
            end
        else
            session["devise.google_data"] = request.env["omniauth.auth"]
            redirect_to new_user_session_url and return
        end
    end

    def twitter
        auth = env["omniauth.auth"]
        @user = User.find_for_twitter_oauth(request.env["omniauth.auth"],current_user)
        if @user.persisted?
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
            sign_in_and_redirect @user, :event => :authentication
            actual = session[:actual_url]
            if !actual.nil?        
                redirect_to(actual) 
            else 
                redirect_to tutorials_path
            end
        else
            session["devise.twitter_uid"] = request.env["omniauth.auth"]
            redirect_to new_user_session_url
        end
    end


end
