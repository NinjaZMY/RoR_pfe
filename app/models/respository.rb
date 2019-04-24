class Respository < ApplicationRecord
has_many :site ,dependent: :destroy

end
