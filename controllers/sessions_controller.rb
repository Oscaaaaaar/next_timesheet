get '/session' do
    login_failed = false
    erb :'sessions/login', locals:{
        login_failed: login_failed
    }
end

post '/session' do
    email = params['email']
    password = params['password']
    user = get_user_by_email(email)
    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']
        redirect '/'
    else 
        login_failed = true
        erb :'sessions/login', locals:{
            login_failed: login_failed
        }
    end
end

delete '/session' do
    session['user_id'] = nil
    redirect '/'
end