extends StaticBody2D

signal on_brick_hit

@export var width = 96
@export var x_padding = 30
@export var height = 28
@export var y_padding = 5

var points;
var colors = [
	Color("#EA2014"), # red
	Color("#FCEEAF"), # yellow
	Color("#4F6F23"), # green
]

func init(row, col):
	points = 3 - row;
	$ColorRect.color = colors[row];
	var x = (col + 1) * width + (col * x_padding);
	var y = (row + 1) * height + (row * y_padding);
	print("%d %d" % [x, y]);
	position = Vector2(x, y);

func hit():
	queue_free();
	on_brick_hit.emit(points);

