require 'securerandom'

class PhotosController < ApplicationController

    def show
        photo = Photo.find_by(id: params[:id])
        send_file photo.file_location, type: 'image/png', disposition: 'inline'
    end

    def create
        @group = Group.find_by(id: params[:id])
        member = GroupMember.find_by(user_id: @user.id, group_id: @group.id)

        uploaded_io = params[:picture]

        # Pick a random filename
        filename = "#{SecureRandom.hex}.photo"
        filepath = Rails.root.join('public', 'uploads', filename)

        File.open(filepath, 'wb') do |file|
            file.write(uploaded_io.read)
        end

        photo = Photo.new
        photo.group_member_id = member.id
        photo.time_posted = DateTime.now
        photo.file_location = filepath
        photo.save

        redirect_to groups_show_page_url(@group.id, "photos")
    end

end
