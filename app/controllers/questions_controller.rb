get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :'/questions/new'
end

post '/questions' do
  question = Question.create(params[:question])
  if request.xhr?
    erb :'/choices/_choices_form', layout: false, locals: {question: question}
  else
    redirect "/questions/#{question.id}/choices/new"
  end
end
