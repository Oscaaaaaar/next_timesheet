def logged_in?()
    !!session['user_id']
end

def current_user
    if logged_in?
        get_user_by_id(session['user_id'])
    end
end

def is_manager?()
    user = get_user_by_id(session['user_id'])
    if user['is_manager'] == 'y'
        true
    else
        false
    end
end

def is_available?(availability)
    if availability == "a"
        return "A"
    else
        return "N"
    end
end