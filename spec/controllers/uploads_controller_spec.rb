RSpec.describe UploadsController, type: :controller do
  let(:upload) { create(:upload) }
  describe 'for logged in admin' do
    let(:admin) { create(:admin) }
    before do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in admin
    end

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
  end

  describe 'for anonymous user' do
    describe 'GET #index' do
      it 'returns http success' do
        expect {
          get :index          
        }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe 'GET #create' do
      it 'returns http success' do
        expect {
          get :create, params: { upload: { email: 'assignee@example.com' } }
        }.to raise_error(Pundit::NotAuthorizedError)
      end
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
