include ApplicationHelper # full_titleメソッドの読み込み

def is_logged_in?
    !session[:user_id].nil?
end

def signin_for_request(user)
    post signin_path, params: { session: { email: user.email,
                                           password: user.password } }
end

def signin_remember(user)
    post signin_path, params: { session: { email: user.email,
                                           password: user.password,
                                           remember_me: '1' } }
end

def current_user
    if (user_id = session[:user_id])
        User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
            signin_for_request user
            user
        end
    end
end

def signin_for_feature(user)
    visit signin_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "サインイン"
end
