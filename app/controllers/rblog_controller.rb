class RblogController < ApplicationController
  
  layout "rblog.html";
  
  $rblogs_limit = 3;
  
  def index
    
    @author = params[:author];
    @from = params[:from].to_i;
    @rblogs = Rblog.recent @author, $rblogs_limit, @from;
    @rblogs_count = ((@author == nil) ? Rblog.count : Rblog.count_authors(@author));
    
  end
  
  def blog_post
    
    @postId = params[:postId];
    
  end

  def sitemap
    
    @authors = Rblog.authors;
    
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
    
  end
  
  def about
  end
  
  def contact
  end
  
end
