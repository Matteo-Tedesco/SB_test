class Department < ApplicationRecord
    belongs_to :user, required: :true   # Permette di inserire un riferimento delle tabelle alle quali è vincolata
    
    has_many :reservations, dependent: :destroy             #
    has_many :quick_reservations, dependent: :destroy       #
    has_many :favourite_spaces, dependent: :destroy         # Permette la distruzione a cascata di tutte le associazioini collegate
    has_many :week_days, dependent: :destroy                #
    has_many :spaces, dependent: :destroy                   #
    has_many :seats, through: :spaces, dependent: :destroy  #

    accepts_nested_attributes_for :week_days            # 
    accepts_nested_attributes_for :spaces               # 
    accepts_nested_attributes_for :seats                # 
    accepts_nested_attributes_for :reservations         # Permette di aggiornare altre tabelle accedendovi tramite le associazioni
    accepts_nested_attributes_for :quick_reservations   #
    accepts_nested_attributes_for :favourite_spaces     #

    def self.ransackable_attributes(auth_object = nil)
        ["cap", "citta", "civico", "created_at", "dep_event", "dep_map", "description", "floors", "id", "latitude", "longitude", "manager", "name", "number_of_spaces", "provincia", "updated_at", "user_id", "via","created_at", "dep_name", "department_id", "email", "end_date", "floor", "id", "is_sync", "seat_id", "seat_num", "space_id", "space_name", "start_date", "state", "typology", "updated_at", "user_id"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["favourite_spaces", "quick_reservations", "reservations", "seats", "spaces", "user", "week_days"]
    end
end
