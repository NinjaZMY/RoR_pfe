class Site < ApplicationRecord
has_many :fragment ,dependent: :destroy
belongs_to :user
belongs_to :respository
end
