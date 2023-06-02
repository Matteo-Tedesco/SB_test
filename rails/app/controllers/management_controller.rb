class ManagementController < ApplicationController
  before_action :authenticate_user!

  # Pagina di gestione del sito da parte degli admin
  def index

    if(current_user.is_admin?) # Se si è amministratori, inizializza le variabili per il management

      # Risultato della query tramite barra di ricerca
      @usr = User.ransack(params[:q])
      @dep = Department.ransack(params[:q])
      @res = Reservation.ransack(params[:q])

      @users = @usr.result(distinct: true)        #             @users            gli utenti                                           tutti gli utenti
      @departments = @dep.result(distinct: true)  # Inizializza @departments  con i dipartimenti  risultani dalla query. Query nulla = tutti i dipartimenti
      @reservations = @res.result(distinct: true) #             @reservations     le prenotazioni                                      tutte le prenotazioni

    else # Altrimenti blocca l'accesso alla pagina
      redirect_back(fallback_location: root_path)
      flash[:alert] = "Attenzione: per gestire il sito devi essere un amministratore!"
    end
  end

end
