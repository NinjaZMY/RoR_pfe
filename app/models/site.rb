class Site < ApplicationRecord
has_many :fragment ,dependent: :destroy
belongs_to :user
belongs_to :respository
has_many :notification , dependent: :destroy
end
