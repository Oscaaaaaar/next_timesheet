get '/' do
    if logged_in?() && uploaded?(session['user_id'])
        manager_id = find_timesheet(session['user_id'])['manager_id']
        timesheets = get_all_timesheets_by_manager_id(manager_id)
        erb :index, locals:{
            timesheets: timesheets
        }
    else
        erb :index
    end
  end
  
get '/new' do
    wrong_password = false
    erb :'users/new', locals:{
        wrong_password: wrong_password
    }
end

post '/new' do
    name = params['name']
    email = params['email']
    is_manager = params['is_manager']
    password = params['password']
    confirm_password = params['confirm_password']
    if password == confirm_password
        create_new(name, email, is_manager, password)
        redirect '/session'
    else
        wrong_password = true
        erb :'users/new', locals:{
            wrong_password: wrong_password
        }
    end
end

        