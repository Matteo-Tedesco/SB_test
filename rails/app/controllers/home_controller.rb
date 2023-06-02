require 'json'

class HomeController < ApplicationController

  # Pagina home del sito
  def index
    @dep = Department.ransack(params[:q])      # Risultato della query tramite barra di ricerca
    @departments = @dep.result(distinct: true) # Inizializza @departments con quelli risultani dalla query (query nulla = tutti i dipartimenti)
    @week_days = WeekDay.all
    @quick_reservation = QuickReservation.where(user_id: current_user.id).first if user_signed_in?

    lati = params[:lati]
    long = params[:long]

    if(lati and long)
      respond_to do |format|

        response = RestClient.get('http://www.7timer.info/bin/api.pl?lon='+long+'&lat='+lati+'&product=civil&output=json')
        array = JSON.parse(response)
        giorno = array["init"]
        info_g1 = array["dataseries"][0]
        timepoint = info_g1["timepoint"]
        wind10m = info_g1["wind10m"]
        lifted_index = info_g1["lifted_index"]
        
        prec_amount = info_g1["prec_amount"]
        if   (prec_amount==0) then pa = "_"
        elsif(prec_amount==1) then pa = "0-0.25mm/hr"
        elsif(prec_amount==2) then pa = "0.25-1mm/hr"
        elsif(prec_amount==3) then pa = "1-4mm/hr"
        elsif(prec_amount==4) then pa = "4-10mm/hr"
        elsif(prec_amount==5) then pa = "10-16mm/hr"
        elsif(prec_amount==6) then pa = "16-30mm/hr"
        elsif(prec_amount==7) then pa = "30-50mm/hr"
        elsif(prec_amount==8) then pa = "50-75mm/hr"
        elsif(prec_amount==9) then pa = "Over 75mm/hr"
        end

        cloudcover = info_g1["cloudcover"]
        if   (cloudcover==1) then cc="0%-6%"
        elsif(cloudcover==2) then cc="6%-19%"
        elsif(cloudcover==3) then cc="19%-31%"
        elsif(cloudcover==4) then cc="31%-44%"
        elsif(cloudcover==5) then cc="44%-56%"
        elsif(cloudcover==6) then cc="56%-69%"
        elsif(cloudcover==7) then cc="69%-81%"
        elsif(cloudcover==8) then cc="81%-94%"
        elsif(cloudcover==9) then cc="94%-100%"
        end

        weatherType = info_g1["weather"]
        if   (weatherType=="clearday"     || weatherType== "clearnight"     ) then icon = 'clear.png'
        elsif(weatherType=="pcloudyday"   || weatherType== "pcloudynight"   ) then icon = 'pcloudy.png'
        elsif(weatherType=="mcloudyday"   || weatherType== "mcloudynight"   ) then icon = 'mcloudy.png'
        elsif(weatherType=="cloudyday"    || weatherType== "cloudynight"    ) then icon ='cloudy.png'
        elsif(weatherType=="humidday"     || weatherType== "humidnight"     ) then icon = 'fog.png'
        elsif(weatherType=="lightrainday" || weatherType== "lightrainnight" ) then icon = 'lightrain.png'
        elsif(weatherType=="oshowerday"   || weatherType== "oshowernight"   ) then icon = 'oshower.png'
        elsif(weatherType=="ishowerday"   || weatherType== "ishowernight"   ) then icon = 'ishower.png'
        elsif(weatherType=="lightsnowday" || weatherType== "lightsnownight" ) then icon = 'lightsnow.png'
        elsif(weatherType=="rainday"      || weatherType== "rainnight"      ) then icon = 'rain.png'
        elsif(weatherType=="snowday"      || weatherType== "snownight"      ) then icon = 'snow.png'
        elsif(weatherType=="rainsnowday"  || weatherType== "rainsnownight"  ) then icon = 'rainsnow.png'
        end

        velocità_vento = wind10m["speed"]
        if   (velocità_vento == 1) then velocità = "Below 0.3m/s"
        elsif(velocità_vento == 2) then velocità = "0.3-3.4m/s"
        elsif(velocità_vento == 3) then velocità = "3.4-8.0m/s"
        elsif(velocità_vento == 4) then velocità = "8.0-10.8m/s"
        elsif(velocità_vento == 5) then velocità = "10.8-17.2m/s"
        elsif(velocità_vento == 6) then velocità = "17.2-24.5m/s"
        elsif(velocità_vento == 7) then velocità = "24.5-32.6m/s"
        elsif(velocità_vento == 8) then velocità = "Over 32.6m/s "
        end

        temperatura =     info_g1["temp2m"]
        umidità =         info_g1["rh2m"]
        direzione_vento = wind10m["direction"]
        prec_type =       info_g1["prec_type"]

        format.html { render :index, locals: {icon: icon, temperatura: temperatura, umidità: umidità, cc: cc, direzione_vento: direzione_vento, velocità: velocità, prec_type: prec_type, pa: pa}}
      end
    end

  end

end
