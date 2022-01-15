tasks:
  -- manage oggs
  ogg:      => for mp3 in wildcard "**.mp3" do sh "ffmpeg -i '#{mp3}' -c:a libvorbis -q:a 4 '#{basename mp3}.ogg'" unless fs.exists "#{basename mp3}.ogg"
  rmogg:    => for ogg in wildcard "**.ogg" do fs.delete ogg
  -- utils
  copyover: => sh "cp -r dist /mnt/c/Users/usuario/Desktop/"
  pack:     => sh "cd dist && zip -r on-angels.zip index.html data"
  butler:   => sh "butler push dist/on-angels.zip actuallydael/on-angels:linux-mac-win-stable --userversion #{@v or error "VERSION"}"
  copydata: => sh "rm -r dist/data && cp -r data dist/data"
  server:   =>
    show "Starting http.server..."
    sh "python3 -m http.server -d dist 2> /dev/null > /dev/null"
  -- test
  test:     => sh "tweego -o /mnt/c/Users/usuario/Desktop/test.html test"
  -- build
  compile: =>
    if args.dist.d or args.dist.debug or @d or @debug
      show "Compiling (debug)..."
      sh "tweego -t -o dist/index.html src"
    else
      show "Compiling..."
      sh "tweego -o dist/index.html src"
  clean: =>
    fs.delete "dist"
    --fs.delete "/mnt/c/Users/usuario/Desktop/dist" if fs.exists "/mnt/c/Users/usuario/Desktop/dist"
    --tasks.rmogg!
  dist: =>
    -- create dist folder
    unless fs.isDir "dist"
      show "Creating 'dist' folder..."
      fs.makeDir "dist"
    -- compile
    tasks.compile!
    -- copy data
    show "Copying 'data' to 'dist/data'..."
    tasks.copydata!