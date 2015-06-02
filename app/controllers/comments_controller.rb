class CommentsController < ApplicationController

    def create
        photo = Photo.find_by(id: params[:id])

        comment = Comment.new
        comment.user_id = @user.id
        comment.photo_id = photo.id
        comment.content = params[:content]
        comment.time_posted = DateTime.now
        comment.save

        redirect_to groups_show_page_url(photo.group, "photos")
    end

end
