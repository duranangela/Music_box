require 'rails_helper'

describe 'nav system' do
  it 'tests link to new song' do
    artist = Artist.create(name: 'Wild Cherry')

    visit artist_path(artist)

    click_link "Add new song"

    expect(current_path).to eq(new_artist_song_path(artist))
  end

  it 'tests link to new artist' do
    visit artists_path

    click_link 'Add New Artist'

    expect(current_path).to eq(new_artist_path)
  end
end
