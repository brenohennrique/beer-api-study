require 'rails_helper'

RSpec.describe Brand, type: :model do
  it { expect(described_class.ancestors).to include ApplicationRecord }

  context 'validates' do
    subject { create(:brand) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_uniqueness_of(:name) }
  end
end
