get '/nci' do

  @clinics = NCIClinicalTrials.clinical_trial_search(params[:state])

  @data = JSON.parse(@clinics)#[:trials][0][:sites][0])
  p @data
  # @clinical_sites = {}
  # data.each do |key, value|
  #     @clinical_sites[key] = value
  #  end
   p params
   erb :'NCI/show'
end
