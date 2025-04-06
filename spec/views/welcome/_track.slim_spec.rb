# frozen_string_literal: true

require 'rails_helper'

describe 'welcome/_track', type: :view do
  before do
    track = FactoryBot.create :track, published: true
    @tr = assign(:track, track)
    render
  end
  it 'renders header body and footer sections' do
    assert_select '.track .hd'
    assert_select '.track .bd'
  end
  it 'renders the title' do
    assert_select '.hd h2.title', /#{@tr.title}/
  end
  it 'renders the audio tag' do
    assert_select '.bd audio'
  end
  it 'renders a download link' do
    assert_select ".bd .download a[track_id='#{@tr.id}'] i.icon-download"
  end
end
