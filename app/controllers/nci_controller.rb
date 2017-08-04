require 'json'


get '/nci' do

  @clinics = NCIClinicalTrials.clinical_trial_search(params[:state])

  data= JSON.parse(@clinics)#[:trials][0][:sites])
  p data
  @clinical_sites = []
  data.each do |hash|
      @clinical_sites << hash
   end
   p params
   erb :'NCI/show'
end
