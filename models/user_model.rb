def create_new(name, email, is_manager, password)
    password_digest = BCrypt::Password.create(password)
    run_sql("INSERT INTO users(name, email, is_manager, password_digest) VALUES ($1, $2, $3, $4)", [name, email, is_manager, password_digest])
end

def get_user_by_email(email)
    result = run_sql("SELECT * FROM users WHERE email = $1", [email])
    if result.to_a.count > 0
        result[0]
    else
        nil
    end
end

def get_user_by_id(id)
    run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end

