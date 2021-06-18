class AttractionsController < ApplicationController
  # GET /attractions or /attractions.json
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1 or /attractions/1.json
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = @attraction.rides.build(user_id:current_user.id)
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # POST /attractions or /attractions.json
  # def create
  #   @attraction = Attraction.new(attraction_params)

  #   respond_to do |format|
  #     if @attraction.save
  #       format.html { redirect_to @attraction, notice: "Attraction was successfully created." }
  #       format.json { render :show, status: :created, location: @attraction }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @attraction.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

    def create 
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end 

     # GET /attractions/1/edit
    def edit
      @attraction = Attraction.find_by(id: params[:id])
      @ride = @attraction.rides.build(user_id:current_user.id)
    end


  # PATCH/PUT /attractions/1 or /attractions/1.json
  # def update
  #   respond_to do |format|
  #     if @attraction.update(attraction_params)
  #       format.html { redirect_to @attraction, notice: "Attraction was successfully updated." }
  #       format.json { render :show, status: :ok, location: @attraction }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @attraction.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

    def update
      attraction = Attraction.find_by(id: params[:id])
      attraction.update(attraction_params)
      redirect_to attraction_path(attraction)
    end 

  # DELETE /attractions/1 or /attractions/1.json
  # def destroy
  #   @attraction.destroy
  #   respond_to do |format|
  #     format.html { redirect_to attractions_url, notice: "Attraction was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end


    # Use callbacks to share common setup or constraints between actions.
    # def set_attraction
    #   @attraction = Attraction.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.

    private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating )
    end
end
