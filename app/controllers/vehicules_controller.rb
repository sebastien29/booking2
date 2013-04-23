class VehiculesController < ApplicationController
  # GET /vehicules
  # GET /vehicules.json
  def index
    @vehicules = Vehicule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehicules }
    end
  end

  # GET /vehicules/1
  # GET /vehicules/1.json
  def show
    @vehicule = Vehicule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicule }
    end
  end

  # GET /vehicules/new
  # GET /vehicules/new.json
  def new
    @vehicule = Vehicule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicule }
    end
  end

  # GET /vehicules/1/edit
  def edit
    @vehicule = Vehicule.find(params[:id])
  end

  # POST /vehicules
  # POST /vehicules.json
  def create
    @vehicule = Vehicule.new(params[:vehicule])

    respond_to do |format|
      if @vehicule.save

        campaign = Mailjet::Campaign.create(title: "Ma premiere campagne", list_id: Mailjet::List.all.first.id, from: "sebastien@nectify.com", from_name: "Nectify", subject: "mon nouveau produiut", lang: "en", footer: "default")
        campaign.test('demailly.sebastien@gmail.com')

        format.html { redirect_to @vehicule, notice: 'Vehicule was successfully created.' }
        format.json { render json: @vehicule, status: :created, location: @vehicule }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicules/1
  # PUT /vehicules/1.json
  def update
    @vehicule = Vehicule.find(params[:id])

    respond_to do |format|
      if @vehicule.update_attributes(params[:vehicule])
        format.html { redirect_to @vehicule, notice: 'Vehicule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicules/1
  # DELETE /vehicules/1.json
  def destroy
    @vehicule = Vehicule.find(params[:id])
    @vehicule.destroy

    respond_to do |format|
      format.html { redirect_to vehicules_url }
      format.json { head :no_content }
    end
  end
end
