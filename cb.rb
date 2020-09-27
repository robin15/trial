#need to execute "gem install win32-clipboard" in advance.

require 'win32/clipboard'

ENV['PATH'] = 'C:\Ruby23-x64\work\clipboard\test'
p path = ENV['PATH']

p cp = Win32::Clipboard.data # クリップボードのデータを取得 

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

if system('start test.html') == nil
    puts "error command."
end

#aaaaaa