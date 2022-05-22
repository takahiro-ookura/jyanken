def janken
puts "最初はグー、じゃんけん..."
puts "[0]:グー\n:チョキ\n:パー"

player_hand = gets.to_i

program_hand = rand(3)

if player_hand > 2
	puts "入力された値が無効です"
	return true
end
jankens=["グー","チョキ","パー"]

puts "あなたの手:#{jankens[player_hand]}, プログラムの手:#{jankens[program_hand]}"

if player_hand == program_hand
	puts "あいこ"
	return true
elsif (player_hand == 0 && program_hand ==1) ||(player_hand == 1 && program_hand ==2) || (player_hand == 2 && program_hand ==0)
	puts "あなたの勝ちです"
   return false
else
	puts "負け"
	return false
end
end


def main
 
 while !IsGameDecided()
 end
end

def IsGameDecided
 jankenResult = JankenResult()
 if jankenResult == 2
   puts "あいこで.."
   return false
 end

 if !IsAhoiDecided()
   puts "またまたじゃんけん..."
   return false
 end

 if jankenResult == 1
   puts "やったー！勝った！"
 else
   puts "残念..負けたー"
 end
 return true
end
 
def JankenResult
 puts "じゃんけん..."
 choices = ["グー", "チョキ", "パー"]
 ShowStartMessage(choices)

 player_hand = gets.to_i
 program_hand = rand(choices.size)
 ShowChoiceInfo(choices[player_hand], choices[program_hand])

 result = 0 
 if player_hand == program_hand
   result = 2
 elsif ((player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0))
   result = 1
 end
 return result
end

def IsAhoiDecided
 puts "あっち向いて〜"
 choices = ["上", "下", "左", "右"]
 ShowStartMessage(choices)

 player_direction = gets.to_i
 program_direction = rand(choices.size)
 ShowChoiceInfo(choices[player_direction], choices[program_direction])

 return (player_direction == program_direction)
end

def ShowStartMessage(choices)
 numChoices = choices.size
 for i in 0..(numChoices-1) do
   puts i.to_s + "(" + choices[i] + ")"
 end
end

def ShowChoiceInfo(playerChoiceString, programChoiceString)
 puts "ホイ！"
 separator = "------------------------"
 puts separator
 puts "あなた：#{playerChoiceString}"
 puts "相手：#{programChoiceString}"
 puts separator
end

main()

next_game = true

while next_game
  next_game = janken
end