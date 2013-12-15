class UserMailer < ActionMailer::Base
	default from: 'notifications_tngovt@tngovt.com'
 
  def report_mailer(user,email,ticket,url)
    @user = user
    @url  = url
    @ticket = ticket
    mail(to: email, subject: 'Issue reported')
  end
end
