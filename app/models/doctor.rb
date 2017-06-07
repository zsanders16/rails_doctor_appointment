class Doctor < ApplicationRecord
    validates_presence_of :name, :specialty

    has_many :appointments
    has_many :patients, through: :appointments
end
