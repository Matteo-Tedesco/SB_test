class UserMailer < ApplicationMailer
    default from: 'spacebook.adm@gmail.com'
 
  def blocked_account_email
    @user = params[:user]
    @url  = 'https://localhost:8083/users/sign_in'
    mail(to: @user.email, subject: 'Your account has been blocked')
  end

  def unlocked_account_email
    @user = params[:user]
    @url  = 'https://localhost:8083/users/sign_in'
    mail(to: @user.email, subject: 'Your account has been unlocked')
  end 
  
  def accepted_manager_email
    @user = params[:user]
    @url  = 'https://localhost:8083/users/sign_in'
    mail(to: @user.email, subject: 'Your account has been given Manager role')
  end

  def removed_manager_email
    @user = params[:user]
    @url  = 'https://localhost:8083/users/sign_in'
    mail(to: @user.email, subject: 'Your account has been stripped of Manager role')
  end

end
