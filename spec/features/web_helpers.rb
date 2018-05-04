
def sign_in_and_play
  visit('/')
  click_button('2 player')
  fill_in 'player1', with: 'Larry'
  fill_in 'player2', with: 'Judge Deathmun'
  click_button('Submit')
end
