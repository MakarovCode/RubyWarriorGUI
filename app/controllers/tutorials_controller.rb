class TutorialsController < ApplicationController

    before_action :authenticate_user!, only: [:index]

    def index
        @tutorials = Tutorial.all
        @categories = Category.in_menu.each

    end

    def show
        @tutorial = Tutorial.find(params[:id])
        if @tutorial.visits_count.nil?
            @tutorial.visits_count = 0
        end
        @tutorial.visits_count += 1
        @tutorial.save!
        @pages = @tutorial.pages.page(params[:page]).per(3).order("id ASC")
        @comments = @tutorial.tutorial_comments.order("created_at DESC")
        @comment = TutorialComment.new
    end

end
