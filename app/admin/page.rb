ActiveAdmin.register Page do

    permit_params :content, :title

    belongs_to :tutorial

    form do |f|
        f.inputs "General" do
            f.input :title
            f.input :tutorial
            f.input :content, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
        end
        f.actions
    end
end