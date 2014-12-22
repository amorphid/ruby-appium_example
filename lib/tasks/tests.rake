require "net/http"

namespace :tests do
  task :run do
    # kill previous instances of Appium Server
    `ps -A | grep "node /usr/local/bin/appium"`.each_line do |line|
      pid = line.split(" ").first
      `kill -9 #{pid}`
    end

    # start Appium Server
    system("appium &")

    # wait until Appium Server starts
    loop do
      uri = URI("http://0.0.0.0:4723")

      begin
        Net::HTTP.get(uri)
        break
      rescue
      end
    end

    # run tests
    system("bundle exec rspec")

    # kill previous instances of Appium Server
    `ps -A | grep "node /usr/local/bin/appium"`.each_line do |line|
      pid = line.split(" ").first
      `kill -9 #{pid}`
    end
  end
end
