class UsersController < ApplicationController
    def index
        @first_mans = User.where(gender: 'man', grade: '1')
        @first_womans = User.where(gender: 'woman', grade: '1')
        @second_mans = User.where(gender: 'man', grade: '2')
        @second_womans = User.where(gender: 'woman', grade: '2')
    end

    def create
        checked_first_m = params["first_m"].select { |key, value| value == "1" }.keys
        checked_first_w = params["first_w"].select { |key, value| value == "1" }.keys
        checked_second_m = params["second_m"].select { |key, value| value == "1" }.keys
        checked_second_w= params["second_w"].select { |key, value| value == "1" }.keys
        
        max_first_m = params["max_count"]["first_m"].to_i
        max_first_w = params["max_count"]["first_w"].to_i
        max_second_m = params["max_count"]["second_m"].to_i
        max_second_w = params["max_count"]["second_w"].to_i
        
        circle_date = CircleDate.create(date: params["date"].to_date)

        decide_user_group(max_first_m, checked_first_m, "1男", circle_date.id)
        decide_user_group(max_first_w, checked_first_w, "1女", circle_date.id)
        decide_user_group(max_second_m, checked_second_m, "2男", circle_date.id)
        decide_user_group(max_second_m, checked_second_w, "2女", circle_date.id)
        
        redirect_to user_path(circle_date)
        # binding.pry
    end    

    def new
        # @user = User.new(name: params[:user]["name"], grade: params[:user]["grade"], gender: params["gender"])
        @user = User.new
        @user.save
        # redirect_to users_path
    end

    def show
        circle_date = CircleDate.find(params[:id])
        @all_groups = circle_date.groups
        # binding.pry
    end

    private

    def select_members(max_count, checked_members)
        if max_count < checked_members.size
            checked_members.sample(max_count)
        else
            checked_members
        end
    end

    def create_user_groups(user_ids, group_id)
        user_ids.each do |user_id|
            UserGroup.create(user_id: user_id, group_id: group_id)
        end
    end

    def decide_user_group(max_count, checked_members, status, circle_date_id)
        selected_member_names = select_members(max_count, checked_members)
        group = Group.create(status: status, max: max_count, circle_date_id: circle_date_id)
        user_ids = User.where(name: selected_member_names).pluck(:id)
        create_user_groups(user_ids, group.id)
    end
end
