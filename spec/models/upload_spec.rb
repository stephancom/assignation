RSpec.describe Upload, type: :model do
  let(:filename) { 'SigBall-aubergine.jpg' }
  let(:jpg) { fixture_file_upload(filename, 'image/jpg') }
  let(:jpg_blob) { create_file_blob }
  subject(:upload) { create(:upload) }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:file) }

  describe 'attached file' do
    it 'should not initially have a file attached' do
      expect(upload.file_attached?).to be false
    end

    it 'can accept an attachment' do
      upload.file.attach(jpg)
      expect(upload.file_attached?).to be true
    end
  end
end
