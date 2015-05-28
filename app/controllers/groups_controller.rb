class GroupsController < ApplicationController

    before_action :require_user
    before_action :require_group, :only => [:show, :edit, :update, :destroy]
    before_action :require_member, :only => [:show, :edit, :update, :destroy]
    before_action :require_admin, :only => [:edit, :update, :destroy]

    def require_user
        if session[:user_id].blank?
            redirect_to sessions_new_url, notice: "You must be logged in to do that."
            return
        end
        @user = User.find_by(id: session[:user_id])
        if not @user
            session.delete(:user_id)
            redirect_to sessions_new_url, notice: "Not a valid user."
        end
    end

    def require_group
        @group = Group.find_by(id: params['id'])
        if not @group
            redirect_to groups_index_url, notice: "Not a valid group."
        end
    end

    def require_member
        @member = GroupMember.find_by(user_id: @user.id, group_id: @group.id)
        if not @member
            redirect_to groups_index_url, notice: "You are not a member of that group"
        end
    end

    def admin_status
        return GroupMember.find_by(user_id: @user.id, group_id: @group.id).admin
    end

    def require_admin
        if not admin_status
            redirect_to groups_index_url, notice: "You must be an admin to do that."
        end
    end

    def index
        @groups = Group.joins(:users).where("users.id = ?", session[:user_id])
    end

    def show
        @admin = admin_status
        @active_page = params[:page] ? params[:page] : "comments"
        @pages = ["comments", "photos", "members", "info"]
    end

    def new
    end

    def create
        group = Group.new
        group.name = params[:name]
        group.description = params[:description]
        group.save

        member = GroupMember.new
        member.group_id = group.id
        member.user_id = @user.id
        member.admin = true
        member.save

        redirect_to groups_index_url
    end

    def edit
    end

    def update
        @group.name = params[:name]
        @group.description = params[:description]
        @group.save
        redirect_to groups_show_url(@group.id)
    end

    def destroy
        @group.delete
        redirect_to groups_index_url
    end
end
