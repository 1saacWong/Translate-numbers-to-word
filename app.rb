require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/numbers_to_words')
  require('pry')

  get('/') do
    erb(:form)
  end

  get('/display') do
    @result = params.fetch('number').numbers_to_words()
    erb(:form)
  end
