require 'open-uri'
class SitesController < ApplicationController
  before_action :current_site, only: [:show, :edit, :update, :destroy]
  before_action -> {Before_Create_Update()} ,  only: [:create,:update] 
    
                                          

  def index
    @sites = Site.all
  end

  def show

  end

  def move 
   if request.post?
    label=params[:label]
    unless(label.nil?)
    Respository.create(label:label)
    end  
   end 
  end 

  def Scrap 
    if request.post?
    Fragment.where(site_id:$site_id).destroy_all
    length=params[:length].to_i  
      for i in 0..(length-1) do
      #@site
      #$site_id
      index=i.to_s
      @fragment=params[:fragment][index]
      ordre=i+1;
        
      Fragment.create(:site_id => $site_id , 
      :length => length , :ordre => ordre   , :content => @fragment)
        
      end 
      site=Site.find($site_id)
    redirect_to site_path(site)

    end  
    
  end  


  def new
    @site = Site.new
    
  end

  def create
    
     
  
    #:nom , :url , :user_id
    
    site = Site.create(:nom => @nom , :url => @site_url ,
      :user_id => @user_id , :respository_id=> 1 )
    # do the next thing
      




    #site_id , length=1 , ordre = 1 ; content = "the whole page"
      

    @fragment = Fragment.create(:site_id => site[:id] , 
      :length => 1 , :ordre => 1   , :content => $content )

    redirect_to site_path(site)
            
  end

  def edit
    
  end

  def update
    
    @site=Site.where(id:params[:id]).update(:nom => @nom , :url => @site_url ,
      :user_id => @user_id)
    Fragment.where(site_id:params[:id]).update(:site_id => params[:id] , 
      :length => 1 , :ordre => 1   , :content => $content)
    if(@site.class==Array)
    $url= site_path(@site)
    else
    $url= request.original_url  
    end
  redirect_to $url  
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

  
  def Before_Create_Update
    begin
        $e=""#connected
        connexion = Nokogiri::HTML(open('https://www.google.com/'))
        rescue Exception => $e
      end     
        
        if ($e!="")
        redirect_to request.original_url
        else
          begin
          $e=""#connected
          site_url=site_params[:url]
          content = Nokogiri::HTML(open(site_url))
          rescue Exception => $e
          end     
          
          if ($e!="") #not connected
          redirect_to request.original_url
          else
          #:nom , :url , :user_id
          
          @user_id = current_user[:id] 
          @site_url = site_url
          @nom = site_params[:nom]
          # do the next thing
          $content=content.to_s  
          
          
          
          end  
        end



  end  












 helper_method :Before_Create_Update
 helper_method :site_params 
end