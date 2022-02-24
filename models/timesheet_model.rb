def create_timesheet(user_id, mon, tue, wed, thu, fri, sat, sun, notes, manager_id)
    run_sql("INSERT INTO timesheets(user_id, manager_id, mon, tue, wed, thu, fri, sat, sun, notes) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)", [user_id, manager_id, mon, tue, wed, thu, fri, sat, sun, notes])
end

def edit_timesheet(user_id, mon, tue, wed, thu, fri, sat, sun, notes, manager_id)
    run_sql("UPDATE timesheets SET manager_id = $1, mon = $2, tue = $3, wed = $4, thu = $5, fri = $6, sat = $7, sun = $8, notes = $9 WHERE user_id = $10", [manager_id, mon, tue, wed, thu, fri, sat, sun, notes, user_id])
end

def uploaded?(id)
    result = run_sql("SELECT * FROM timesheets WHERE user_id = $1", [id])
    if result.to_a.count > 0;
        true
    else
        false
    end
end

def day_available(day, id)
    result = run_sql("SELECT * FROM timesheets WHERE user_id = $1", [id])
    if result.to_a.count > 0 && result[0][day] == "a";
        true
    else
        false
    end
end

def find_timesheet(id)
    result = run_sql("SELECT * FROM timesheets WHERE user_id = $1", [id])
    if result.to_a.count > 0
        result[0]
    else
        nil
    end
end

def get_all_timesheets_by_manager_id(id)
    run_sql("SELECT * FROM timesheets WHERE manager_id = $1", [id])
end

