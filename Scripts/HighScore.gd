extends Node
const SAVE_PATH = "user://data.dat"

var highscore := load_highscore()
func save_highscore(highscore:int):
    var f := File.new()
    f.open(SAVE_PATH,File.WRITE)
    f.store_var(highscore)
    f.close()


func load_highscore() -> int:
    var f := File.new()
    if f.file_exists(SAVE_PATH):
        f.open(SAVE_PATH,File.READ)
        var high = f.get_var()
        f.close()
        return high
    else:
        return 0