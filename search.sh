#! /bin/sh

# --context=num
#     Print num lines of leading and trailing output context.
grep \
  --context=3 \
  --group-separator=----------------------------------------- \
  --recursive \
  --line-number \
  --colour \
  "$*" \
  /usr/local/src/luatex \
  "$HOME/repos/tex/mailing_lists" \
  /usr/local/texlive \
  .
