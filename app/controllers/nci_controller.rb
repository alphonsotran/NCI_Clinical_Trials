post '/nci' do
  p "poop " * 100
  @clinics = NCIClinicalTrials.clinical_trial_search(params[:state])

  @data = JSON.parse(@clinics)#[:trials][0][:sites][0])
  @sites = []
  @data["trials"][0]["sites"][0..10].each do |site|
    @sites << site
  end

  @coordinates = []
  @sites.each do |site|
    @coordinates << site["org_coordinates"].values
  end
  require 'pry-byebug'; binding.pry
  if request.xhr?
    p "% " * 100
    status 200
    p '*'*100
    erb :'NCI/show', layout: false
  else
    status 422
    redirect '/'
  end
end
