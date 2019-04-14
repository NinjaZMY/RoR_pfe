class SitesController < ApplicationController
  before_action :current_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
  #Fragment.create(idSite:current_site[:id])

  end

  def new
    @site = Site.new
  end

  def create
    site = Site.create(site_params)
    redirect_to site_path(site)
  end

  def edit

  end

  def update
    @site.update(site_params)

    redirect_to site_path(@site)
  end

  def destroy
    @site.destroy

    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(:nom, :url)
  end

  def current_site
    @site = Site.find(params[:id])
  end

end