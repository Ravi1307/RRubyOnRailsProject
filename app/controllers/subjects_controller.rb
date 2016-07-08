class SubjectsController < ApplicationController
  
  layout false;
  
  def index
    @subjects = Subject.sorted;
  end

  def show
    @subject = Subject.find(params[:id]);
  end

  def new
    
    #@subject_count = Subject.count;
    @subject = Subject.new({:name=>"Default"});
      
  end

  def create
    
    #initiate a new object using form parameters
    @subject = Subject.new(params.require(:subject).permit(:name, :position, :visible));
    
    #save the object
    if @subject.save
      
      #if save succeds redirect to index section
      flash[:notice] = "Subject created successfully";
      redirect_to(:action=>'index');
    
    else
      
      #if fails render and redisplay the form so that user can 
      @subject_count = Subject.count;
      render('new');
      
    end
    
  end
  
  def edit
    #@subject_count = Subject.count;
    @subject = Subject.find(params[:id]);
  end

  def update
    
    @subject = Subject.find(params[:id]);
    
    if @subject.update_attributes(params.require(:subject).permit(:name, :position, :visible));
      
      flash[:notice] = "Subject updated successfully";
      redirect_to(:action=>'show', :id=>@subject.id);
      
    else
      
      #@subject_count = Subject.count;
      render('edit');
      
    end
    
  end
    
  def delete
    @subject = Subject.find(params[:id]);
  end

  def destroy
    
    @subject = Subject.find(params[:id]);
    #@subject.destroy;
    @subject = Subject.find(params[:id]).destroy;
    
    #falsh[:notice] = "Subject '#{subject.name}' destroyed successfully";
    redirect_to(:action => 'index');
    
  end
  
end
