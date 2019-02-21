class UploadsController < ApplicationController
  before_action :set_upload_via_token, only: %i[edit update]
  # after_action :verify_authorized, except: %i[edit update]

  def index
    @uploads = Upload.all
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params_for_create)

    if @upload.save
      redirect_to uploads_path, notice: 'Upload assignment created.'
    else
      redirect_to uploads_path, notice: "Upload assignment failed: #{@upload.errors.messages}"
    end
  end

  def edit; end

  def update
    if @upload.update(upload_params_for_update)
      redirect_to private_upload_url(@upload.token), notice: 'File uploaded'
    else
      render :edit
    end
  end

  private

  def set_upload_via_token
    @upload = Upload.find_by!(token: params[:token])
  end

  def upload_params_for_create
    params.require(:upload).permit(:email, :description)
  end

  def upload_params_for_update
    params.require(:upload).permit(:file, :description)
  end
end
