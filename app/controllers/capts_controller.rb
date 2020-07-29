# frozen_string_literal: true

class CaptsController < ApplicationController # rubocop:todo Style/Documentation
  before_action :set_capt, only: %i[show edit update destroy]

  before_action :authenticate_user!, except: %i[index show]

  # GET /capts

  # GET /capts.json

  def index
    @capts = Capt.all.order('created_at DESC')

    @capt = Capt.new
  end

  # GET /capts/1

  # GET /capts/1.json

  def show; end

  # GET /capts/new

  def new
    @capt = current_user.capts.build
  end

  # GET /capts/1/edit

  def edit
    @capt = Capt.find(params[:id]) 
end

  # POST /capts

  # POST /capts.json

  # def create # rubocop:todo Metrics/AbcSize
  #   @capt = current_user.capts.build(capt_params)

  #   respond_to do |format|
  #     if @capt.save

  #       format.html { redirect_to root_path, notice: 'Capt was successfully created.' }

  #       format.json { render :show, status: :created, location: @capt }

  #     else

  #       format.html { render :new }

  #       format.json { render json: @capt.errors, status: :unprocessable_entity }

  #     end
  #   end
  # end

  def create
  @capt = Capt.new(capt_params)
   if @capt.save
    flash[:notice] = 'Post was successfully created'
    redirect_to capts_path(@capt)
   else
    render 'new'
   end
end

  # PATCH/PUT /capts/1

  # PATCH/PUT /capts/1.json

  # def update
  #   respond_to do |format|
  #     if @capt.update(capt_params)

  #       format.html { redirect_to @capt, notice: 'Capt was successfully updated.' }

  #       format.json { render :show, status: :ok, location: @capt }

  #     else

  #       format.html { render :edit }

  #       format.json { render json: @capt.errors, status: :unprocessable_entity }

  #     end
  #   end
  # end

def update
    @capt = Capt.find(params[:id])
    if @capt.update(capt_params)
        flash[:notice] = "Post was successfully updated"
        redirect_to capt_path(@capt)
    else
        render 'edit'
    end
end

  # DELETE /capts/1

  # DELETE /capts/1.json

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
