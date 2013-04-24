class LivraisonsController < ApplicationController
  # GET /livraisons
  # GET /livraisons.json
  def index
    @livraisons = Livraison.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @livraisons }
    end
  end

  # GET /livraisons/1
  # GET /livraisons/1.json
  def show
    @livraison = Livraison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @livraison }
    end
  end

  # GET /livraisons/new
  # GET /livraisons/new.json
  def new
    @livraison = Livraison.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @livraison }
    end
  end

  # GET /livraisons/1/edit
  def edit
    @livraison = Livraison.find(params[:id])
  end

  # POST /livraisons
  # POST /livraisons.json
  def create

    livraisons = Livraison.where("created_at < ?", (Time.now) )


    if livraisons.size != 0
      v = Vehicule.where("id not in (?)", livraisons.map{ |livraison| livraison.vehicule_id }).first
      #redirect_to new_livraison_path, notice: "requete"
      #return
    else
      v = Vehicule.first
      #redirect_to new_livraison_path, notice: "AB"
      #return

    end

    if v.nil?
      redirect_to new_livraison_path, notice: "Plus de vehicule disponible"
      return
    end

    @livraison = Livraison.new(params[:livraison])
    @livraison.vehicule_id = v.id


    respond_to do |format|
      if @livraison.save
        format.html { redirect_to @livraison, notice: 'Livraison was successfully created.' }
        format.json { render json: @livraison, status: :created, location: @livraison }
      else
        format.html { render action: "new" }
        format.json { render json: @livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /livraisons/1
  # PUT /livraisons/1.json
  def update
    @livraison = Livraison.find(params[:id])

    respond_to do |format|
      if @livraison.update_attributes(params[:livraison])
        format.html { redirect_to @livraison, notice: 'Livraison was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @livraison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livraisons/1
  # DELETE /livraisons/1.json
  def destroy
    @livraison = Livraison.find(params[:id])
    @livraison.destroy

    respond_to do |format|
      format.html { redirect_to livraisons_url }
      format.json { head :no_content }
    end
  end
end
