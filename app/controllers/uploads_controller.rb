include Pundit
class UploadsController < ApplicationController
  before_action :set_upload_via_token, only: %i[edit update]
  after_action :verify_authorized
  after_action :verify_policy_scoped, only: :index

  def index
    @uploads = policy_scope(Upload)
    @upload = authorize Upload.new, :new?
  end

  def create
    @upload = authorize Upload.new(upload_params_for_create)

    if @upload.save
      redirect_to uploads_path, notice: 'Upload assignment created.'
    else
      redirect_to uploads_path, notice: "Upload assignment failed: #{@upload.errors.messages}"
    end
  end

  def edit
    authorize @upload
  end

  def update
    authorize @upload

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
