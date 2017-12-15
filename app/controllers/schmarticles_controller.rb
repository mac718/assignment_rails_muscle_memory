class SchmarticlesController < ApplicationController
  before_action :set_schmarticle, only: [:show, :edit, :update, :destroy]

  # GET /schmarticles
  # GET /schmarticles.json
  def index
    @schmarticles = Schmarticle.all
  end

  # GET /schmarticles/1
  # GET /schmarticles/1.json
  def show
  end

  # GET /schmarticles/new
  def new
    @schmarticle = Schmarticle.new
  end

  # GET /schmarticles/1/edit
  def edit
  end

  # POST /schmarticles
  # POST /schmarticles.json
  def create
    @schmarticle = Schmarticle.new(schmarticle_params)

    respond_to do |format|
      if @schmarticle.save
        format.html { redirect_to @schmarticle, notice: 'Schmarticle was successfully created.' }
        format.json { render :show, status: :created, location: @schmarticle }
      else
        format.html { render :new }
        format.json { render json: @schmarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schmarticles/1
  # PATCH/PUT /schmarticles/1.json
  def update
    respond_to do |format|
      if @schmarticle.update(schmarticle_params)
        format.html { redirect_to @schmarticle, notice: 'Schmarticle was successfully updated.' }
        format.json { render :show, status: :ok, location: @schmarticle }
      else
        format.html { render :edit }
        format.json { render json: @schmarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schmarticles/1
  # DELETE /schmarticles/1.json
  def destroy
    @schmarticle.destroy
    respond_to do |format|
      format.html { redirect_to schmarticles_url, notice: 'Schmarticle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schmarticle
      @schmarticle = Schmarticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schmarticle_params
      params.require(:schmarticle).permit(:title, :body)
    end
end
