extends Node2D

var begin_range = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Word/word/word_guess.text = choose_word()
	var the_word = $Word/word/word_guess.text
	print("The word is "+ the_word)

func get_words():
	var word_array = []
	var f = File.new()
	f.open("words.txt", f.READ)
	while not f.eof_reached():
		word_array.append(f.get_line())
	f.close()
	return word_array

func choose_word():
	var word_array = get_words()
	var end_range = len(word_array)
	var random_generator = RandomNumberGenerator.new()
	random_generator.randomize()
	var index = random_generator.randf_range(begin_range, end_range)
	var word = word_array[index]
	#print(word)
	return word

func split_word():
	var wrd = choose_word()
	var num = len(wrd)
	var word_array = []
	for c in wrd:
		word_array.append(c)
	print(word_array)

