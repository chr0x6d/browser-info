class MainController < ApplicationController
  def home
    @ip_addr = request.remote_ip
    @browser = BrowserSniffer.new(request.env['HTTP_USER_AGENT'])
    @current = current_visit
    @geo = Geocoder.search(request.remote_ip)

    tor_detect = TorDetector::Base.new()
    @tor = tor_detect.call(request.remote_ip)
  end
end
