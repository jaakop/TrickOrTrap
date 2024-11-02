extends Panel
class_name JinxMeter

func setJinxLevel(jinxes: int):
    var children = get_children();

    for i in children.size():
        var sprite = children[i] as Sprite2D
        if(i < jinxes):
            sprite.show()
        else:
            sprite.hide();
    pass;