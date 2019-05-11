require 'open-uri'
class SitesController < ApplicationController
  before_action :current_site, only: [:show, :edit, :update, :destroy]
  before_action -> {Before_Create_Update()} ,  only: [:create,:update] 
    
                                          

  def index
    @sites = Site.all
  end

  def show

  end

  def standBy
    if request.post? 
    site_id=params[:site_id]  
    tolerationCounter=params[:TolerationCounter].to_i
    time_to_watch=params[:time_to_watch].to_f*60
    site=Site.find(site_id)
    site.update(TolerationCounter:tolerationCounter,time_to_watch:time_to_watch)
    end  #end request.post?
  end #end of standBy function  
 def SuperDelete
  if request.post?
  linkNumber=params[:LinkNumber].to_i
  respositoryNumber=params[:RespositoryNumber].to_i
    unless(linkNumber==0)#if there's at least one link
      for i in 1..linkNumber do
      index=i.to_s 
      link=params[:link]
        if(link.nil?)
        break
        end  
      site_id=link[index].to_i
      query=Site.where(id:site_id)
      validQuery=(query.length!=0)
        if(validQuery)
        Site.find(site_id).delete
        end  
      end # end for    
    end #end unless linkNumber==0
    unless(respositoryNumber==0)#if there's at least one folder
      for i in 1..respositoryNumber do
      index=i.to_s
      respository=params[:Respository]
        if(respository.nil?)
        break
        end  #end if
      respository_id=respository[index].to_i
      query=Respository.where(id:respository_id)
      validQuery=(query.length!=0)
        if(validQuery)
        Respository.find(respository_id).delete
        Site.where(respository_id:respository_id).delete_all
        end  #end if 
      end # end for  
      unless(respository.nil?)
      redirect_to delete_path
      end #end unless respository.nil?
    end #end unless 
  end  #end if request.post?
 end # end of function
 
  def move 
   if request.post?
    label=params[:label]
    unless(label.nil?)
    Respository.create(label:label)
    end  #end unless
    ordre=params[:ordre]
    unless(ordre.nil?) # if ordre!=nil // action = move files 
    length=ordre.to_i  
      for i in 1..length do 
       index=i.to_s  
       site_id=params[:link][index].to_i   
       respository_target_id=params[:target]
       respository_id=respository_target_id.to_i 
       Site.where(id:site_id).update(respository_id:respository_id) 
      end # end for   
    redirect_to move_path+"?"+respository_target_id
    end  # end unless(ordre.nil?)
      respository_id=params[:FolderToRename].to_i
        unless(respository_id==0)#if action == Rename Folder    
        newFolderName=params[:NewFolderName]  
        Respository.find(respository_id).update(label:newFolderName)
        redirect_to move_path+'?'+respository_id.to_s
        end #end unless(respository_id==0)  
      end #end if request.post?
  end # end of function

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
    time_to_watch=300
    site = Site.create(:nom => @nom , :url => @site_url ,
      :user_id => @user_id , :respository_id=> 1 , :time_to_watch => time_to_watch )
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












 
end