# Project Name: Surveys
## Description
```
Surveys is a stand alone Sinatra application built in the spirit of Service Oriented Architecture (SOA).
```
## Goals
```
Surveys is designed to be a small service able to integrate into several different projects. The original intent is for a larger Rails application that assists teachers with attendance, student success strategies tracking and research based predictive analytics to consume API data from surveys. Surveys has a table for questions, answers and question categories. It sends user Id, class ID and answer ID back to the main application, which in turn creates views for teachers in order to assist in education goals.
```
## Core Technical Concepts/Inspiration
```
Sinatra
ActiveRecord
Postgresql
Fast JSON API
```

## Getting Started/Requirements/Prerequisites/Dependencies
```
run the following commands:

bundle install
bundle exec figaro install
bundle exec rake db:{create,migrate,seed}
RACK_ENV=test rake db:migrate
```
## Local Host
in your CLI:
```bundle exec shotgun```
in your browser:
```http://localhost:9393```
```https://aqueous-caverns-33840.herokuapp.com/```

## API Endpoints
```
get '/api/v1/questions'
get '/api/v1/responses'
get '/api/v1/all_responses'
get '/api/v1/answers'
get '/api/v1/q_and_a'
post '/api/v1/responses'
```
## Versioning
```
v1  5/27/2019
```
## Contributing
```
Github: https://github.com/JennicaStiehl/surveys

Contributor Guidelines
Code Style/Requirements
Format for commit messages
Thank you (name contributors)
```
## TODO
```
Next steps
Features planned
Known bugs (shortlist)
```

## Resources
```
Project Guidelines: http://backend.turing.io/module3/projects/terrificus
RSpec: https://gist.github.com/Jamedjo/5792332
http://recipes.sinatrarb.com/p/testing/rspec?
Readme Template: https://github.com/zalando/zalando-howto-open-source/blob/master/READMEtemplate.md
Setup: https://gist.github.com/jtallant/fd66db19e078809dfe94401a0fc814d2
https://stackoverflow.com/questions/20638136/undefined-method-desc-for-sinatraapplicationclass
```
### My notes:
databases: 'surveys-development', 'surveys-test'
```surveys-development=#

select * from responses inner join choices on responses.choice_id = choices.id inner join questions on questions.id = choices.question_id;

select * from responses inner join choices on responses.choice_id = choices.id;

select * from categories inner join questions on categories.id = questions.category_id;
```
