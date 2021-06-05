ActiveAdmin.register Tutorial do

  permit_params :title, :score, :visits_count, :number_of_pages, :version, :objective, :category, :category_id, 
                category_tutorials_attributes: [:id, :category, :category_id, :version, :tutorial, :tutorial_id]

  index do
    selectable_column
    id_column
    column :title
    column :version
    column :score
    column :visits_count
    column :number_of_pages
    column :pages do |t|
      link_to "Paginas x #{t.pages.count}", admin_tutorial_pages_path(t)
    end
    actions
  end
  
  form do |f|
    f.inputs "General" do
      f.input :category
      f.input :title
      f.input :visits_count
      f.input :score
      f.input :version
      f.input :number_of_pages
      f.input :objective, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400, :toolbar => 'Full' } }
      
      f.has_many :category_tutorials do |category|
        category.inputs "Categorias" do
          category.input :category
          category.input :version
        end
      end
    end
    f.actions
  end
  
end
