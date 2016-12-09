$: << '../lib'
require_relative '../lib/connect_four'

zac = ConnectFour::Player.new('zac', 'x')
leo = ConnectFour::Player.new('leo', 'o')
players = [zac, leo]
ConnectFour::Game.new(players).play