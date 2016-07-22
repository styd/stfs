require 'rails_helper'

describe 'Viewing tweets search page before keyword is input' do
  it "doesn't show the 'Search Results:' header" do
    visit tweets_url

    expect(page).not_to have_text("Search Results:")
  end
end

describe 'Viewing list of tweets search results' do
  before :each do
    visit tweets_url
    fill_in "query", with: "trump"
    click_button "Find"
  end

  it 'shows the "Search Results:" header' do
    expect(page).to have_text("Search Results:")
  end

  it 'shows the keyword' do
    expect(page).to have_text(/trump/i)
  end
end
