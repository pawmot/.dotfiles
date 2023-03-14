function clippaste -d 'paste from clipboard'
  switch (uname)
  case Linux
    xsel --clipboard --output
  case Darwin
    pbpaste
  case '*'
    echo "paste not supported for (uname)"
  end
end
