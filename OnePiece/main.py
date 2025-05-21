import json

path = "/Users/deepanshubajaj/OnePiece/OnePiece/Arcs.json"

with open(path, 'r') as file:
    content = json.load(file)
    for i in content:
        straw_hats = i["straw_hats"]
        print(straw_hats)
        lowercase_straw_hats = [hat.lower() for hat in straw_hats]
        i["straw_hats"] = lowercase_straw_hats

with open("/Users/maniklakhanpal/OnePiece/OnePiece/Arcs.json", 'w') as file:
    json.dump(content, file)