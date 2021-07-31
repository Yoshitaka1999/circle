class UsersController < ApplicationController
    def index
        @first_mans = User.where(gender: 'man', grade: '1')
        @first_womans = User.where(gender: 'woman', grade: '1')
        @second_mans = User.where(gender: 'man', grade: '2')
        @second_womans = User.where(gender: 'woman', grade: '2')
    end

    def create
        checked_first_m = params["first_m"].select { |key, value| value == "1" }.keys
        max_first_m = params["max_count"]["first_m"].to_i
        binding.pry
        if max_first_m < checked_first_m.size
            checked_first_m.sample(max_first_m)
        else
            checked_first_m
        end

        checked_first_w = params["first_w"].select { |key, value| value == "1" }.keys
        max_first_w = params["max_count"]["first_w"].to_i
        binding.pry
        if max_first_w < checked_first_w.size
            checked_first_w.sample(max_first_w)
        else
            checked_first_w
        end

        checked_second_m = params["second_m"].select { |key, value| value == "1" }.keys
        max_second_m = params["max_count"]["second_m"].to_i
        binding.pry
        if max_second_m < checked_second_m.size
            checked_second_m.sample(max_second_m)
        else
            checked_second_m
        end

        checked_second_w = params["second_w"].select { |key, value| value == "1" }.keys
        max_second_w = params["max_count"]["second_w"].to_i
        binding.pry
        if max_second_w < checked_second_w.size
            checked_second_w.sample(max_second_w)
        else
            checked_second_w
        end
    end
end
