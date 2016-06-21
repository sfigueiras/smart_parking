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

    current_user.select_patent

    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  def select
    current_user.select_patent(params[:id])

    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  private

  def patent_params
    params.require(:patent).permit(:id, :number)
  end
end