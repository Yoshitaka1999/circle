class User < ApplicationRecord
    enum gender: { man: 0, woman: 1}
    has_many :user_groups
    has_many :groups, through: :user_groups 
end
