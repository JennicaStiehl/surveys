require_relative '../models/survey.rb'
require 'sinatra'

class SurveysApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)
end
