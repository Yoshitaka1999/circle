class CircleDate < ApplicationRecord
    has_many :groups, dependent: :destroy
end
