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
    request["postman-token"] = 'a0993ea2-f4c2-fb35-7c63-3ae82d91e94b'

    response = http.request(request)
  end

end
