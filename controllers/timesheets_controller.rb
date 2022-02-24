require 'pry'
get '/timesheets/new' do
    erb :'timesheets/new'
end

post '/timesheets/new' do
    if uploaded?(current_user['id'])
        edit_timesheet(session['user_id'], params['mon'], params['tue'], params['wed'], params['thu'], params['fri'], params['sat'], params['sun'], params['notes'], params['manager_id']);
        redirect '/'

    else
        create_timesheet(session['user_id'], params['mon'], params['tue'], params['wed'], params['thu'], params['fri'], params['sat'], params['sun'], params['notes'], params['manager_id']);
        redirect '/'
    end
end

get '/timesheets/edit' do
    redirect '/timesheets/new'
end