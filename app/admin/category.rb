ActiveAdmin.register Category do 
  permit_params :name, :description, :show_in_menu, :image
end
