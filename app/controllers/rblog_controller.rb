class RblogController < ApplicationController
  
  layout "rblog.html";
  
  $rblogs_limit = 5;
  $rblogs_from = 0;
  #$rblogs_max = Rblog.recent.size;
  
  def index
    
    @rblogs = Rblog.recent $rblogs_limit, $rblogs_from;
    
  end
  
  def blog_post
    
    @postId = params[:postId];
    
  end
  
  def new_post
    
    @rblog = Rblog.new(params.require(:blog_post).permit(:author, :post_title, :post_message));
    
    if @rblog.save
      
      flash[:notice] = "Posted Successfully";
      
      redirect_to(:action=>'index');
      
    else
      
      flash[:notice] = "Posting Failed";
      
      render('blog_post');
      
    end
    
    #$rblogs_max = Rblog.recent.size;
    
  end
  
  def about
  end
  
  def contact
  end
  
  def sitemap
  end
  
end
