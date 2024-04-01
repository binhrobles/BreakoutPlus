extends StaticBody2D

signal on_brick_hit

@export var width = 96
@export var x_padding = 30
@export var height = 28
@export var y_padding = 5

var points;
var row;
var col;
var ROW_CONFIGS = [
	{
		"speedMod": 1.08,
		"color": Color("#EA2014"), # red
	},
	{
		"speedMod": 1.04,
		"color": Color("#FCEEAF"), # yellow
	},
	{
		"speedMod": 1.02,
		"color": Color("#4F6F23"), # green
	},
]

func init(_row, _col):
	row = _row;
	col = _col;
	points = 3 - row;
	
	$ColorRect.color = ROW_CONFIGS[row].color;
	
	var x = (col + 1) * width + (col * x_padding);
	var y = (row + 1) * height + (row * y_padding);
	position = Vector2(x, y);

func hit():
	queue_free();
	on_brick_hit.emit(points);
	return ROW_CONFIGS[row].speedMod;

