module Capybara
  class Session
    def has_image?(src)
       has_xpath?("//img[contains(@src,\"app/assets/images/#{src}\")]")
    end
  end
end
