class PublicsController < ApplicationController
  def index
  end

  def faq
  end

  def contact
	@contact = Contact.new
  end

  def create_contact
		@contact = Contact.new(contact_params)
		
		if @contact.save
			redirect_to tutorials_path, :notice => "Comentario enviado!"
		else
		# render "new"
		  redirect_to contact_publics_path, :alert => "Comentario no enviado por que: " << @contcontact.errors.full_messages.to_sentence.to_s 
		end		
  end


  def about_us
  end


    private
    def contact_params
      params.require(:contact).permit(
									    :name,
									    :phone,
									    :email,
									    :issue,
									    :description,
									    :ubication,
									    :created_at,
									    :updated_at      
                                  )
    end



end
