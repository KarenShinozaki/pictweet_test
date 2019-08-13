def movie_info(movie, data)
  puts movie[data]
end

movie = {"title" => "ハリーポッター", "genre" => "ファンタジー", "year" => "2001年"}

puts "以下から一つを選んで入力してください。
  ・title
  ・genre
  ・year"

info = gets.chomp

movie_info(movie, info)
