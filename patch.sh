#! /bin/bash
set -eux

cd wat

patch -p1 < ../wast.patch

for file in crates/wast/**/*.rs ; do
  cat $file | sed "s/std::/crate::stdlib::/" > /tmp/newfile
  mv /tmp/newfile $file
done
