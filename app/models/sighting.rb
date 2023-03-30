class Sighting < ApplicationRecord
    belongs_to :animal
    validates :longitude, :latitude, :date, presence: true
end
