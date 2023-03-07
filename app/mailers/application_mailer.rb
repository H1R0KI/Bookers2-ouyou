class ApplicationMailer < ActionMailer::Base
  default from: ENV['address']
  layout "mailer"
end
