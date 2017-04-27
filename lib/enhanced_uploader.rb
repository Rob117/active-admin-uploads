module EnhancedUploader
  # Include in lib/
  # Under forms, simply extends EnhancedUploader, then use like:
  # form do |f|
  # input_audio f, :property_with_carrier_wave_that_is_audio
  # input_image f, :property_with_carrier_wave_that_is_image
  # Will then automatically offer audio controls or show thumbnail if exists

  # We grab the form object, then try to get the specific object we want to
  # input to replace. If that object exists, we show it as a hint.
  def input_audio(f, property)
    f.input property, hint: audio_content(f.object, property)
  end

  def input_image(f, property)
    f.input property, hint: image_content(f.object, property)
  end

# We simply grab an object and check to see if our property exists on it.
# If it does, display the object
  def audio_content(object, property)
    if object.persisted? && object.respond_to?(property)
      audio_tag object.send(property), controls: true
    else
      content_tag(:span, 'No Current Audio')
    end
  end

  def image_content(object, property)
    if object.persisted? && object.respond_to?(property)
      image_tag object.send(property), height: 150
    else
      content_tag(:span, 'No Current Image')
    end
  end
end

# Use Examples:

# Index file

# show do
#   extend EnhancedUploader
#   attributes_table do
#     row :name
#     row :image do |s| # This is a carrierwave image attrubute
#       image_content s, :image
#     end
#     row :sample_audio do |s|
#       audio_content s, :sample_audio
#     end
#   end
# end

# Input forms:

# form do |f|
#   extend EnhancedUploader
#   f.semantic_errors
#   Rails.logger.info(f.object.errors.inspect)
#   tabs do
#     tab 'basic' do
#       f.inputs do
#         f.input :name_english
#         f.input :name
#         f.input :order_num
#         input_image f, :image
#         input_image f, :thumbnail
#       end
#     end
#     tab 'files' do
#       f.inputs do
#         input_audio f, :sound_effect
#         input_audio f, :voice_file
#         input_audio f, :music
#       end
#     end
#   end
#   f.actions
# end
