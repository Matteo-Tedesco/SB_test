class AdminMailer < ApplicationMailer

  def request_manager_role_email(admin_mail)
    @user = params[:user]
    @url  = 'https://localhost:8083/users/sign_in'
    mail(to: admin_mail, subject: 'The user '+@user.email+' requested manager role!')
  end

end
