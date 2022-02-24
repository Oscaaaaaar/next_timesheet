require 'date'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'

enable :sessions 

require_relative 'db/db'

require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/timesheets_controller'

require_relative 'models/user_model'
require_relative 'models/timesheet_model'
 
require_relative 'helpers/sessions_helper'

