require 'open-uri'
class SitesController < ApplicationController
  before_action :current_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show

  end

  def new
    @site = Site.new
      
  end

  def create
    
      begin
        $e=""#connected
        connexion = Nokogiri::HTML(open('https://www.google.com/'))
        rescue Exception => $e
      end     
        
        if ($e!="")
        redirect_to new_site_path
        else
          begin
          $e=""#connected
          content = Nokogiri::HTML(open(site_params[:url]))
          rescue Exception => $e
          end     
          
          if ($e!="") #not connected
          redirect_to new_site_path
          else
          #site_id , length=1 , ordre = 1 ; content = "the whole page"
          
          site = Site.create(site_params)
          # do the next thing
          content=content.to_s  

      


    
    
          @fragment = Fragment.create(:site_id => site[:id] , 
           :length => 1 , :ordre => 1   , :content => content )
    
          redirect_to site_path(site)
          end  
        end
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