class PatentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patent = Patent.new
    @patents = current_user.user_patents
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
    patent = current_user.user_patents.where(patent_id: params[:id]).first
    current_user.user_patents.delete(patent)
    current_user.select_patent if patent.selected?

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