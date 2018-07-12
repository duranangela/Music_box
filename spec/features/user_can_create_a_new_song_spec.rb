require 'rails_helper'

describe 'user can create a new song' do
  it 'by filling out a form' do
    artist = Artist.create(name: 'Wild Cherry')
    song_title = 'Play That Funky Music'
    song_length = 267
    song_play_count = 340000

    visit new_artist_song_path(artist)

    select artist.name, from: :song_artist_id
    fill_in :song_title, with: song_title
    fill_in :song_length, with: song_length
    fill_in :song_play_count, with: song_play_count
    click_on 'Create Song'

    expect(page).to have_content(song_title)
    expect(page).to have_content(song_length)
    expect(page).to have_content(song_play_count)
  end
end
