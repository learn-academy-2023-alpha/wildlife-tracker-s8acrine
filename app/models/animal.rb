class Animal < ApplicationRecord
    #creates association to sightings table
    has_many :sightings
    #allows adding sighting data with animal data using the sightings_attributes:
    accepts_nested_attributes_for :sightings

    #validates that only non empty values can be inputted
    validates :name, :scientific_name, presence: true
    #ensures common and scientific name are not the same
    validate :name_cannot_be_scientific_name
    #ensures no duplicates are added to the database
    validates :name, :scientific_name, uniqueness: true

    def name_cannot_be_scientific_name
        if name === scientific_name
            errors.add(:name, 'name cannot match scientific name')
        end
    end
end
