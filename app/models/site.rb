class Site < ApplicationRecord
has_many :fragment ,dependent: :destroy

end
