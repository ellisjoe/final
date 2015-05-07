class GroupsController < ApplicationController

    def index
        @groups = Group.all.limit(100)
    end

    def show
        @group = Group.find_by(id: params['id'])
    end

    def new
    end

    def create
        group = Group.new
        group.name = params[:name]
        group.description = params[:description]
        group.save
        redirect_to index_url
    end

    def edit
        @group = Group.find_by(id: params[:id])
    end

    def update
        group = Group.find_by(id: params[:id])
        group.name = params[:name]
        group.description = params[:description]
        group.save
        redirect_to index_url
    end

    def destroy
        group = Group.find_by(id: params[:id])
        group.delete
        redirect_to index_url
    end
end
