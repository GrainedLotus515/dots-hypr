command_not_found_handler() {
    printf "%s%s? wat da fuck is dat?!\n" "$acc" "$0" >&2
    return 127
}

zipdir() {
  setopt EXTENDED_GLOB
  GLOB_DOTS=off

  for dir in *(/); do
    local out="${dir%/}.tar.zst"

    if [[ -f $out ]]; then
      echo "skip: '$dir' → '$out' exists"
      continue
    fi

    # Try to create the archive and handle errors
    {
      echo "archive: '$dir' → '$out'"
      tar cf - -- "$dir" | pzstd -t >| "$out"
    } || {
      printf "%s%s? Failed to archive directory '%s'.\n" "$acc" "$0" "$dir" >&2
      return 1
    }
  done
}
