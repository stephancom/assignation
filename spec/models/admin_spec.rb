RSpec.describe Admin, type: :model do
  subject(:admin) { create(:admin) }

  it { is_expected.to be_valid, subject.errors.map { |k, v| "#{k} #{v}" }.join(', ') }
  it { is_expected.to respond_to(:email) }
end
