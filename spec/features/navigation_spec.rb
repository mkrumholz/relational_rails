require 'rails_helper'

RSpec.describe 'header nav' do
  it 'has a link to the home page' do
    visit '/'

    within 'nav' do
      click_on "Home"
    end

    expect(current_path).to eq '/'
  end

  it 'has a link to the gardens index' do
    visit '/'

    within 'nav' do
      click_on "Community Gardens"
    end

    expect(current_path).to eq '/gardens'
  end

  it 'has a link to the plots index' do
    visit '/'

    within 'nav' do
      click_on "Available Plots"
    end

    expect(current_path).to eq '/plots'
  end

  it 'has a link to the gardens index' do
    visit '/'

    within 'nav' do
      click_on "Flower Shops"
    end

    expect(current_path).to eq '/flower_shops'
  end
end
