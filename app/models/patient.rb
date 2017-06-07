class Patient < ApplicationRecord
    validates_presence_of :name
    validates :gender, inclusion: { in: ['Male', 'Female'] }
    validates :age, inclusion: { in: (0..100) }

    has_many :appointments
    has_many :doctors, through: :appointments

end
