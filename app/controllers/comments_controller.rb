class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        params.permit!
        comment = TutorialComment.new(params[:comment])
        if comment.save
            username = current_user.username
            if username.nil?
                username = "Sin Nombre"
            end
            render status: 200, json: {
                message: "Comentario creado correctamente", 
                comment: comment.description,
                username: username,
                id: comment.id
                }
        else
            render status: 411, json: {message: "Ha ocurrido un error inesperado, vuelve a intentarlo"} 
        end
    end

    def update
        params.permit!
        comment = TutorialComment.find(params[:id])

        if comment.update params[:comment]
            username = current_user.username
            if username.nil?
                username = "Sin Nombre"
            end
            render status: 200, json: {
                message: "Comentario editado correctamente!", 
                comment: comment.description,
                username: username,
                id: comment.id
                }
        else
            render status: 411, json: {message: "Ha ocurrido un error inesperado, vuelve a intentarlo"} 
        end
    end

end