class SpicesController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: render_not_found_response

  # GET /spices
  def index
    render json: Spice.all
  end

  # POST /spices
  def create
    render json: Spice.create(spice_params), status: :created
  end

  # GET /spices/:id
  def show
    render json: find_spice
  end

  # PATCH /spices/:id
  def update
    # NOTE: No shortcut here, MUST attach found spice to var before updating
    # Because find_spice.update(spice_params) = true, not the updated spice
    spice = find_spice
    spice.update(spice_params)
    render json: spice
  end

  # DELETE /spices/:id
  def destroy
    find_spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.permit(:id, :title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: 'Spice not found' }, status: :not_found
  end

  def find_spice
    Spice.find(params[:id])
  end
end
