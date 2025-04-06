# frozen_string_literal: true

require 'rails_helper'

describe WelcomeController, type: :controller do
  describe '#index' do
    before do
      5.times do |index|
        track = FactoryBot.create :track, published: index.even?
        track.save
      end
      get :index
    end
    it 'fetches only published tracks' do
      expect(assigns(:tracks).all?(&:published)).to be_truthy
    end
  end
end
