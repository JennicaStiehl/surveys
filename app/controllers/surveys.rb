require_relative '../models/question.rb'
require 'sinatra/base' # note this has changed from just 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'
require 'pry'

class SurveysApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/' do
    erb :dashboard
  end

  get '/api/v1/questions' do
    questions = Question.all
    questions.to_json
  end

  get '/api/v1/responses' do
    responses = Response.get_responses
    responses.to_json
  end

  get '/api/v1/q_and_a' do
    question_id = params[:question_id]
    q_and_a = Question.get_q_and_a(question_id)
    q_and_a.to_json
  end

  post '/api/v1/responses' do
    response_data = params
    # get info from params & headers
    response_data.map do |response|
      response = Response.new(response)
      if response.save
        {message: "data recorded in the survey database"}
      else
        {message: "failure to load data into survey database"}
      end
    end
    # create a response record
    message.to_json
    # error messaging
    # post `/response?student_id=1&class_id=2` header: {responses:{1:"yes", 2:"4",5:"2",6:"green"}}
  end

end
