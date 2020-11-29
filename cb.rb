#need to execute "gem install win32-clipboard" in advance.

#//DOCUMENT/設計情報//aaa.doc

require 'win32/clipboard'

p path = ENV['PATH']
ENV['PATH'] = path + ';C:\Ruby23-x64\work\clipboard\test'

puts cp = Win32::Clipboard.data.force_encoding(Encoding::Shift_JIS) # クリップボードのデータを取得 

if cp.include?("aaaaa")
  server = "aaaaaa"
  port = "5335"
elsif cp.include?("bbbbb")
  server = "bbbbb"
  port = "5336"
else
  puts "is not valid perforce path"
  return
end

system("echo \%PATH\%")
p cmd = "p4v -p " + server + ":" + port + "-s " + cp
cmd.force_encoding(Encoding::Shift_JIS)
if system('exe_html.exe') == nil
    puts "error command."
end

#aaaaaa
put "aaa"
put "aaa"
puts "fff"
puts "hhh"
puts "kkk"
