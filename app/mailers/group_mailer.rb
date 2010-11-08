class GroupMailer < ActionMailer::Base
  default :from => "amigoseguidor@amigoseguidor.com"
  
  def invite(email, group, code)
    @url = "http://localhost:3000/"
    @group = group
    @code = code
    mail(:to => email,
         :subject => "Convite AmigoSeguidor")
  end 
end
