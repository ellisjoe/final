class PostsController < ApplicationController

    def create
        @group = Group.find_by(id: params[:id])
        member = GroupMember.find_by(user_id: @user.id, group_id: @group.id)

        post = Post.new
        post.group_member_id = member.id
        post.title = params[:title]
        post.content = params[:content]
        post.time_posted = DateTime.now
        post.save

        redirect_to groups_show_url(@group.id)
    end

end
