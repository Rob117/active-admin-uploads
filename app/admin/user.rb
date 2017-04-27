ActiveAdmin.register User do
  permit_params :name, :location
  # Show the essential data in the index
  index do
    selectable_column
    column :id
    column :name
    column :location
    column :created_at
    column :updated_at
    actions
  end

  # When you click on the show for any individual item, this data is rendered
  show do
    attributes_table do
      row :id
      row :name
      row :location
      row :created_at
      row :updated_at
    end
  end
  # When you click on edit, this form is rendered
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :location
    end
    f.actions
  end
end
