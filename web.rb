require 'sinatra'
require 'mechanize'
require './kerbside'
require 'date'
require 'tzinfo'

class MySinatraApp < Sinatra::Base
  get '/myhouse' do
    k = Kerbside.new
    @results = k.search(ENV['HOUSE_NUMBER'],ENV['HOUSE_STREET_NAME'])
    tz = TZInfo::Timezone.get('Pacific/Auckland')
    @today = Date.parse(tz.now.to_s)
    @days_to_next = days_to_next(@today,@results[0][1])
    @days_to_other = days_to_next(@today,@results[1][1])
    erb :myhouse
  end

  def days_to_next(d1,d2)
    (d1-d2).to_i.abs
  end
end
