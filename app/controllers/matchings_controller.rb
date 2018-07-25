class MatchingsController < ApplicationController

   def create
    need = Need.find(params[:id])
    rs = Matching.new(matching_params)
    rs.user_id = current_user.id
    rs.need_id = need.id
    rs.save
    redirect_to need_path
  end

  def update
    @mt = Matching.find(params[:id])
    @mt.update(matching_s:1)
    redirect_to needs_path
  end

  def destroy
    @unmt = Matching.find(params[:id])
    @unmt.update(matching_s:2)
    redirect_to needs_path
  end
  private
    def matching_params
      params.require(:matching).permit(:matching_message)
    end
end
