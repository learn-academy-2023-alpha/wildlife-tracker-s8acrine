class Animal < ApplicationRecord
    has_many :sightings
    validates :name, :scientific_name, presence: true
    validate :name_cannot_be_scientific_name
    validates :name, :scientific_name, uniqueness: true

    def name_cannot_be_scientific_name
        if name === scientific_name
            errors.add(:name, 'name cannot match scientific name')
        end
    end
end
