class UsersController < ApplicationController
    def index
        @first_mans = User.where(gender: 'man', grade: '1')
        @first_womans = User.where(gender: 'woman', grade: '1')
        @second_mans = User.where(gender: 'man', grade: '2')
        @second_womans = User.where(gender: 'woman', grade: '2')
    end

    def create
        @user = User.new(name: params[:user]["name"], grade: params[:user]["grade"], gender: params["gender"])
        @user.save
        redirect_to users_path
    end

    def new
        @user = User.new
    end

end
