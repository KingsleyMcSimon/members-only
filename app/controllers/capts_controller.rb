# frozen_string_literal: true

class CaptsController < ApplicationController # rubocop:todo Style/Documentation
  before_action :set_capt, only: %i[show edit update destroy]

  before_action :authenticate_user!, except: %i[index show]

  def index
    @capts = Capt.all.order('created_at DESC')

    @capt = Capt.new
  end

  def show; end

  def new
    @capt = current_user.capts.build
  end

  def edit
    @capt = Capt.find(params[:id])

end

  def create
  @capt = Capt.new(capt_params)
  @capt.user_id = current_user.id
   if @capt.save
    flash[:notice] = 'Post was successfully created'
    redirect_to capts_path(@capt)
   else
    render 'new'
   end
end

def update
    @capt = Capt.find(params[:id])
    if @capt.update(capt_params)
        flash[:notice] = "Post was successfully updated"
        redirect_to capt_path(@capt)
    else
        render 'edit'
    end
end

  def destroy
    @capt.destroy

    respond_to do |format|
      format.html { redirect_to capts_url, notice: 'Post was successfully destroyed.' }

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_capt
    @capt = Capt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def capt_params
    params.require(:capt).permit(:capt)
  end
end
