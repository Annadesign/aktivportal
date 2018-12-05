class Admin::ProvidersController < Admin::ApplicationController
  before_action :set_admin_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.all
  end

  def show
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to admin_providers_url, notice: 'provider was successfully created.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to edit_admin_provider_url@provider, notice: 'provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to admin_providers_url, notice: 'provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:title, :apiurl, :apikey)
    end
end
