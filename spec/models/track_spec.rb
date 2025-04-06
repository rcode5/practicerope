# frozen_string_literal: true

require 'rails_helper'

describe Track do
  before do
    freeze_time
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:audio) }
  end

  describe 'scopes' do
    let(:published) { FactoryBot.create(:track, :published, recorded_on: 7.months.ago, updated_at: 2.days.ago) }
    let(:unpublished1) { FactoryBot.create(:track,  recorded_on: nil, updated_at: 10.seconds.ago) }
    let(:unpublished2) { FactoryBot.create(:track,  recorded_on: 1.year.ago, updated_at: 5.months.ago) }
    let(:unpublished3) { FactoryBot.create(:track,  recorded_on: nil, updated_at: 6.months.ago) }
    let!(:tracks) do
      [published, unpublished1, unpublished2, unpublished3]
    end
    describe '.by_recency' do
      it 'returns results ordered by recorded_on then updated_at' do
        expect(described_class.by_recency.to_a).to eq [published, unpublished2, unpublished1, unpublished3]
      end
    end
    describe '.published' do
      it 'returns only published tracks' do
        expect(described_class.published.to_a).to eq [published]
      end
    end
    describe '.unpublished' do
      it 'returns only unpublished tracks' do
        expect(described_class.unpublished.to_a).to match_array([unpublished1, unpublished2, unpublished3])
      end
    end
  end
end
