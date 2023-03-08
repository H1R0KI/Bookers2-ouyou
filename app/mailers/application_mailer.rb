class ApplicationMailer < ActionMailer::Base
  default from: "管理人より<>"
  layout "mailer"
end
