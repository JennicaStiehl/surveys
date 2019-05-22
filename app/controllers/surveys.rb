require_relative '../models/question.rb'
require 'sinatra/base' # note this has changed from just 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class SurveysApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/' do
    erb :dashboard
  end
end
