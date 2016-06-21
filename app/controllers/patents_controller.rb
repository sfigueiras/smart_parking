class PatentsController < ApplicationController
  def index
    @patent = Patent.new
    @patents = current_user.user_patents
    
    respond_to do |format|
      format.html
    end
  end

  def create
    patent = 
      Patent.where(number: patent_params[:number]).first_or_create
    
    current_user.patents << patent if patent.valid? 
    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  def destroy
    patent = Patent.find(params[:id])
    current_user.patents.delete(patent)

    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  def select
    # Delete selected from the other patent
    current_selected = current_user.user_patents.where(selected: true).first
    current_selected.selected = false if !!current_selected
    byebug

    # Update new patent
    patent = current_user.user_patents.where(patent_id: params[:id]).first
    patent.selected = true
    patent.save!
    byebug

    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  private

  def patent_params
    params.require(:patent).permit(:id, :number)
  end
end