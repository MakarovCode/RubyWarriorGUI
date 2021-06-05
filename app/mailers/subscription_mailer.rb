class SubscriptionMailer < ApplicationMailer
    default from: "contacto@holamundo.la"
	def send_email_new_comment(user)
    	@user = user
    	mail( :to => @user.email,
    	:subject => 'Se ha escrito un comentario' )
  	end

end
