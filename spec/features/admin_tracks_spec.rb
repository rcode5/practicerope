# frozen_string_literal: true

require 'rails_helper'

feature 'Admin' do
  include_context 'admin logged in'
  before do
    mock_cloud_front
  end

  context 'when there are a few tracks' do
    let(:tracks) do
      [
        FactoryBot.create(:track, title: 'not ready for the world yet'),
        FactoryBot.create(:track, :published, title: 'My Public Work'),
        FactoryBot.create(:track, :with_tags, title: 'track with tags', recorded_on: 2.years.ago),
      ]
    end
    let(:track_with_tags) { tracks.last }
    before do
      tracks
      visit admin_index_path
    end

    scenario 'can see state of the db' do
      expect(page).to have_content 'Tracks'
      expect(page).to have_content 'Total:3'
      expect(page).to have_content 'Published:1'
      expect(page).to have_content 'In the wings:2'
    end

    scenario 'can add a track', js: true do
      click_on 'tracks'

      click_on 'add new track'

      fill_in :track_title, with: 'the new track title'

      click_on 'Create Track'

      expect(page).to have_content 'prohibited this track from being saved'
      expect(page).to have_content "Filename can't be blank"

      fill_in :track_title, with: 'track with recorded time'
      fill_in_datepicker(:recorded_on_day, with: '2020-10-10')
      fill_in :recorded_on_time, with: '2:00pm'
      fill_in :track_filename, with: 'the_dir/the_file.mp3'

      #      sleep 1
      click_on 'Create Track'

      expect(page).to have_content 'track with recorded time(draft)'
      expect(page).to have_content '2020-10-10'
    end
  end
end
