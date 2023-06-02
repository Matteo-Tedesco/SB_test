class Reservation < ApplicationRecord
  belongs_to :user, required: true        #
  belongs_to :department, required: true  # Permette di inserire un riferimento delle tabelle alle quali è vincolata
  belongs_to :space, required: true       #
  belongs_to :seat, required: true        #
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dep_name", "department_id", "email", "end_date", "floor", "id", "is_sync", "seat_id", "seat_num", "space_id", "space_name", "start_date", "state", "typology", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["department", "seat", "space", "user"]
  end


end