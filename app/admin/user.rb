ActiveAdmin.register User do
  permit_params :name, :location, :profile_photo, :hello_audio
  # Show the essential data in the index
  index do
    extend EnhancedUploader # include uploader
    selectable_column
    column :id
    column :name
    column :location
    column :profile_photo do |row_object|
      image_content row_object, :profile_photo
    end
    column :hello_audio do |row_object|
      audio_content row_object, :hello_audio
    end
    column :created_at
    column :updated_at
    actions
  end

  # When you click on the show for any individual item, this data is rendered
  show do
    extend EnhancedUploader # include uploader
    attributes_table do
      row :id
      row :name
      row :location
      row :profile_photo do |item|
        image_content item, :profile_photo
      end
      row :hello_audio do |item|
        audio_content item, :hello_audio
      end
      row :created_at
      row :updated_at
    end
  end
  # When you click on edit, this form is rendered
  form do |f|
    extend EnhancedUploader # include uploader
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :location
      input_image f, :profile_photo
      input_audio f, :hello_audio
    end
    f.actions
  end
end
