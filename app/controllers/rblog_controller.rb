class RblogController < ApplicationController
  
  layout "rblog.html";
  
  def index
  
    @rblogs_limit = 3;
    @author = ((params[:author] == nil) ? 'all' : params[:author]);
    @from = params[:from].to_i;
    @rblogs = Rblog.recent @author, @rblogs_limit, @from;
    @rblogs_count = ((@author == 'all') ? Rblog.count : Rblog.count_authors(@author));
    
  end
  
  def blog_post
    
    @postStatus = params[:postStatus];
    @postId = params[:postId];
    @rblog = ((@postStatus == 'new') ? params[:rblog] : Rblog.find(@postId));
    
  end

  def sitemap
    
    @authors = Rblog.authors;
    
  end
  
  def create
    
    @rblog = Rblog.new(params.require(:blog_post).permit(:author, :post_title, :post_message));
    
    if @rblog.save
      
      flash[:notice] = "Posted Successfully";
      
      redirect_to(:action=>'index');
      
    else
      
      flash[:notice] = "Posting Failed";
      
      redirect_to(:action => 'blog_post', :postStatus => 'new', :rblog => @rblog);
      
    end
    
  end
  
  def update
    
    @rblog = Rblog.find(params[:postId]);
    
    if @rblog.update_attributes(params.require(:blog_post).permit(:author, :post_title, :post_message));
      
      flash[:notice] = "Updated Successfully";
      
      redirect_to(:action => 'blog_post', :postStatus => 'show', :postId => @rblog.id);
      
    else
      
      flash[:notice] = "Updating Failed";
      
      redirect_to(:action => 'blog_post', :postStatus => @postStatus, :rblog => @rblog);
      
    end
    
  end

  def destroy
    
    Rblog.find(params[:postId]).destroy;
    
    redirect_to(:action => 'index');
    
  end
  
  def about
  end
  
  def contact
  end
  
end
