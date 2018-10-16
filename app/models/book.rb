class Book < ActiveRecord::Base 

	validates :name, presence: true
	validates :description, presence: true
	
    mount_uploader :cover, AvatarUploader
end
