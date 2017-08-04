module NCIClinicalTrials

  def self.clinical_trial_search(state)
    require 'uri'
    require 'net/http'

    #Interpolate data into this URI
    url = URI("https://clinicaltrialsapi.cancer.gov/v1/clinical-trials?sites.org_state_or_province=#{state}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '8c267558-8d17-6b4f-d0e6-a29054fef45e'

    response = http.request(request)
    response.read_body
  end

end
