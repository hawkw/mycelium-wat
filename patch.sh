#! /usr/bin/bash
set -eux
git apply p.patch

for file in wat/crates/wast/**/*.rs ; do
  cat $file | sed "s/std::/crate::stdlib::/" > /tmp/newfile
  mv /tmp/newfile $file
done
