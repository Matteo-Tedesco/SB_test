class User < ApplicationRecord

  # Permettono la rimozione a cascata dal db quando un utente viene eliminato
  has_many :departments, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :quick_reservations, dependent: :destroy
  has_many :favourite_spaces, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable, :lockable, :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]

  #acts_as_user :roles => [ :manager, :admin, :user ]    #RUOLI DEFINITI PER IL CONTROLLO AUTORIZZAZIONI DI CANARD
  ROLES = %i[manager admin user]                        #RUOLI MOSTRATI NELLE CHECKBOX DI SIGNUP(MANTENERE LO STESSO ORDINE DI :roles !!!)

  before_save :add_default_role

  def has_requested_manager
    if self.requested_manager=='true'
      return true
    else
      return false
    end
  end

  def add_default_role
    if self.role==nil
      self.role='user'
      self.save
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def has_role?(role)
    roles.include?(role)
  end

  def is_manager?
    if self.role.include?("manager")
      return true
    else
      return false
    end
  end

  def is_admin?
    if self.role.include?("admin")
      return true
    else
      return false
    end
  end

  def is_user?
    if self.role.include?("user")
      return true
    else
      return false
    end
  end

  # Omniauth Authentication callback
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(email: data['email'], password: Devise.friendly_token[0,20], confirmed_at: Time.zone.now ) 
    end
    user
  end

  # Check if the user is banned
  def is_banned?
    if self.locked_at!=nil
      return 'true'
    else
      return 'false'
    end
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmed_at", "created_at", "current_sign_in_at", "current_sign_in_ip", "email", "expires_at", "failed_attempts", "id", "last_sign_in_at", "last_sign_in_ip", "latitude", "locked_at", "locking_reason", "longitude", "provider", "remember_created_at", "requested_manager", "reset_password_sent_at", "role", "sign_in_count", "unconfirmed_email", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["departments", "favourite_spaces", "quick_reservations", "reservations"]
  end
  

end
