class ApplicationMailer < ActionMailer::Base
  default from: "noreply@microtwitter.com"
  layout 'mailer'
end
