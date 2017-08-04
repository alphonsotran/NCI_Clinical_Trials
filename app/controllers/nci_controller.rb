get '/nci' do

  @repo = NCIClinicalTrials.clinical_trial_search(params[:state])
  data= JSON.parse(@repo[:trials][0][:sites])
  @repo_names = []
  data.each do |hash|
      @repo_names << hash["name"]
   end
   p params
   erb :'NCI/show'
end