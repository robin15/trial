title = [[777, 888, 999, 111, 222, 333, 444, 555], [777, 888, 999, 111, 222, 333, 444, 555],[777, 888, 999, 111, 222, 333, 444, 555], [777, 888, 999, 111, 222, 333, 444, 555],[777, 888, 999, 111, 222, 333, 444, 555], [777, 888, 999, 111, 222, 333333333, 444, 555]]
#title = [[777, 888, 999], [777, 888, 222]]
#item = [[111, 222, 333, 444, 555], [111, 222, 333, 444, 555]]


str = "
<!DOCTYPE html>
<html>
<body>
<table border=\"2\">
<tr>
<th colspan=\"1\">画像</th>
<th colspan=\"3\">名前</th>
<th colspan=\"5\">年齢</th>
</tr>
<tr>
<th>画像</th>
<th>要素1</th>
<th>要素2</th>
<th>要素3</th>
<th>要素4</th>
<th>要素5</th>
<th>要素6</th>
<th>要素7</th>
<th>要素8</th>
</tr>

"
put "ccc"

puts title.count

title.each do |item| 
    str += "<tr>\n"
    str += "<td><img src=./ruby.bmp width=\"60px\" height=\"30px\"></td>\n"
    item.each do |item| str += "<td>" + item.to_s + "</td>\n" end
    str += "</tr>\n"
end
puts str

#file
File.open("foodstuff.html", mode = "w"){|f|
  f.write(str)  # ファイルに書き込む
}

puts "aaa"
puts "bbb"

