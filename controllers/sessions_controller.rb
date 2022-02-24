get '/session' do
    erb :'sessions/login'
end

post '/session' do
    email = params['email']
    password = params['password']
    user = get_user_by_email(email)
    if user && BCrypt::Password.new(user['password_digest']) == password
        session['user_id'] = user['id']
    end
    redirect '/'
end

delete '/session' do
    session['user_id'] = nil
    redirect '/'
end