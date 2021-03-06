require_relative '../models/question.rb'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class SurveysApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/' do
    erb :dashboard
  end

  get '/documentation' do
    erb :documentation
  end

  get '/api/v1/questions' do
    questions = QuestionSerializer.new(Category.get_questions)
    questions.to_json
  end

  get '/api/v1/responses' do
    responses = ResponseSerializer.new(Response.choice_query)
    responses.to_json
  end

  get '/api/v1/answers' do
    responses = AnswerSerializer.new(Response.answer_query)
    responses.to_json
  end

  get '/api/v1/all_responses' do
    responses = ResponseSerializer.new(Response.all_responses)
    responses.to_json
  end

  get '/api/v1/q_and_a' do
    q_and_a = QandASerializer.new(Question.get_q_and_a(params[:question_id]))
    q_and_a.to_json
  end

  post '/api/v1/responses' do
    if Question.find_by(id: params[:data][:question_id].to_i)
      incoming_response = Response.new(params[:data])
      if incoming_response.save
        {message: "response successfully created"}.to_json
      else
        {message: "failed to create a response"}.to_json
      end
    else {message: "invalid question_id"}.to_json
    end
  end

end
