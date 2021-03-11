copy_polygon() {
  mkdir -p "$2"
  cp -R "$1" "$2"
}

clear_polygon() {
  rm -rf "$1"
}
