class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
  mount_uploader :hello_audio,   HelloAudioUploader
end
