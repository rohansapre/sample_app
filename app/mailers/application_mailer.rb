class ApplicationMailer < ActionMailer::Base
  default from: "noreply@sample-micro-twitter.herokuapp.com"
  layout 'mailer'
end
