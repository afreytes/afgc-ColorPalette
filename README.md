# afgc-ColorPalette
Generate a Dictionary with complimentary range of colors for the given input Color, itself included.

Install
---
Just copy ColorPalette.gd into the Godot project folder where you wish to use it.

Usage
---
Once you have copied the file, to generate a palette of colors based on a main color you provide:

	#Test with a random color
 
	var MyColor 	:Color 		= Color(randf(),randf(),randf())
	var MyPalette	:Dictionary	= ColorPalette.new().Generate(MyColor)

MyPalette now contains a Dictionary with complimentary colors.

To access a specific color in the Dictionary:

	#Look at the script for the string labels used to name the colors; change them to suit your preferences
 
	var NeutralColor = MyPalette["Neutral"] #Assigns the neutral color to variable NeutralColor

To iterate through the Dictionary (Please note: To test the code below you will need a Node that implements the _draw() method such as Node2d):

	func _draw():
		var TextSize := 32
		var font = Label.new().get_theme_font("") #Hacky quick way to get a default font

		#Test with a random color
		var MyColor 	:Color 		= Color(randf(),randf(),randf())
		var MyPalette	:Dictionary	= ColorPalette.new().Generate(MyColor)

		var position = Vector2.ZERO

		for ColorName in MyPalette:
			position.y += TextSize + TextSize
			draw_string(font,position,ColorName,-1,-1,TextSize,MyPalette[ColorName])

This will output the current color text strings in their current color.

Configuration
---
You should change the labels in the script to whatever suits you best.

You should also play with the values, especially for the "Adjacent" colors.

Notes
---
This is pretty straightforward but [njamster on mastodon.gamedev.place](https://mastodon.gamedev.place/@njamster) was asking me to open source it so here it is. I hope it is useful for someone.
