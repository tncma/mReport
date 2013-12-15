class UserMailer < ActionMailer::Base
	default from: 'notifications_tngovt@tngovt.com'
 
  def report_mailer(user,email,ticket)
    @user = user
    @url  = 'http://www.mReport.com'
    @ticket = ticket
    mail(to: email, subject: 'Issue reported')
  end
end
