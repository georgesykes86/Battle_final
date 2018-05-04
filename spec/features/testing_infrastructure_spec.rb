
feature 'Testing infrastructure' do
    scenario 'Larry enters his wicked ass name' do
    sign_in_and_play
    expect(page).to have_content 'Larry'
    expect(page).to have_content 'Judge Deathmun'
  end

  scenario 'play screen displays HP' do
    sign_in_and_play
    expect(page).to have_content '100HP'
  end

end

feature 'Testing battle mechanics' do
  scenario 'Player 1 attacks player 2 and receives confirmation' do
    sign_in_and_play
    click_button('attack')
    expect(page).to have_content 'POW! Judge Deathmun has been slapped!'
  end

  scenario 'Player 2 attacks Player 1' do
    sign_in_and_play
    2.times { click_button('attack') }
    expect(page).to have_content 'POW! Larry has been slapped!'
  end

  scenario 'When attacked, Player 2 health reduced by 2' do
    sign_in_and_play
    click_button('attack')
    expect(page.find('p', id: 'p2_health').text).to eq "90HP"
  end

  scenario 'When attacked, Player 1s health is reduced by 2' do
    sign_in_and_play
    2.times { click_button('attack') }
    expect(page.find('p', id: 'p1_health').text).to eq "90HP"
  end

  scenario 'When no player has died the game still continues' do
    sign_in_and_play
    18.times { click_button('attack') }
    expect(page).not_to have_content("GAME OVER!")
  end

  scenario 'When one player reaches 0HP the game ends' do
    sign_in_and_play
    19.times { click_button('attack') }
    expect(page).to have_content('GAME OVER!')
    expect(page).not_to have_selector('div', class: 'controls')
  end

end
