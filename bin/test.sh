#!/usr/bin/env bash
set -euo pipefail

course_bin_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
exec timeout --kill-after=5s "${HASKELL_TEST_TIMEOUT:-30s}" \
  runhaskell -i"$course_bin_dir/../lib" Spec.hs
