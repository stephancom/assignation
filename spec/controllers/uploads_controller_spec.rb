RSpec.describe UploadsController, type: :controller do
  let(:upload) { create(:upload) }
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create, params: { upload: { email: 'assignee@example.com' } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { token: upload.token }
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe 'GET #update' do
    let(:png) { fixture_file_upload('SigBall-aubergine.jpg', 'image/j') }
    it 'returns http success' do
      get :update, params: { token: upload.token, upload: { file: png } }
      expect(response).to have_http_status(:success)
    end
  end
end
