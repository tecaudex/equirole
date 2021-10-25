class AdsController < ApplicationController
  before_action :set_ad, only: %i[ show edit update destroy ]

  # GET /ads or /ads.json
  def index
    @ads = Ad.paginate(page: params[:page],per_page: 4)
  end
  # GET /ads/1 or /ads/1.json
  def show
    @ad = Ad.find_by(id: params[:id])
    @user = @ad.user
  end
  # GET /ads/new
  def new
    @ad = current_user.ads.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads or /ads.json
  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if (@ad= current_user.ads.create(ad_params))
        format.html { redirect_to @ad, notice: "Ad was successfully created." }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1 or /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: "Ad was successfully updated." }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1 or /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: "Ad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ad_params
      params.require(:ad).permit(:title, :description, :price, :catorgory, :image, :user_id)
    end
end
