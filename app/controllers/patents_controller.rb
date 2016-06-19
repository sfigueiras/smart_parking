class PatentsController < ApplicationController
  def index
    @patent = Patent.new
    @patents = current_user.patents
    
    respond_to do |format|
      format.html
    end
  end

  def create
    patent = 
      Patent.where(number: patent_params[:number]).first_or_create
    
    respond_to do |format|
      if patent.valid? 
        current_user.patents << patent
        format.html { redirect_to patents_path }
      else
        format.html { redirect_to patents_path, alert: patent.errors }
      end
    end
  end

  def destroy
    patent = Patent.find(params[:id])
    current_user.patents.delete(patent)

    respond_to do |format|
      format.html { redirect_to patents_path }
    end
  end

  private

  def patent_params
    params.require(:patent).permit(:id, :number)
  end
end