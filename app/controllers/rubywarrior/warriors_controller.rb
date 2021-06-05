module Rubywarrior
  class WarriorsController < ApplicationController
    layout 'warrior'
    def index
      @warriors = RubywarriorPlayer.all            
    end
    
    def show 
      @warrior = RubywarriorPlayer.find(params[:id])
    end
    
    def new 
      @warrior = RubywarriorPlayer.new
    end
    
    def create 
      params.permit!
      #FALTA AGREGAR LOS OTROS CAMPOS DEL PLAYER
      #FALTA AGREGAR EL ID DEL CURRENT USER PARA PODERLO ASOCIAR (NO ES OBLIGATORIO)
      
      @warrior = RubywarriorPlayer.new params[:rubywarrior_player]
      
      #CREAR DIRECTORIO DEL PLAYER
      
      if @warrior.save
        redirect_to rubywarrior_warrior_level_path(@warrior, 1), notice: "Guerrero creado"
      else
        redirect_to new_rubywarrior_warrior_path, notice: "Ha ocurrido un error inesperado"
      end
    end   

  end
end
