#!/bin/bash

# Copyright 2020 Google LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#      http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -x
REPO=`pwd`

if [[ $# -lt 1 ]]; then
  cat 1>&2 <<EOF
USAGE: $0 [output_directory]
EOF
  exit 1
fi

# The first and only argument to this script should be the name of the
# output directory.
OUTPUT_DIR="$REPO/$1"

cd ZipBuilder
swift run ReleasePackager -keepBuildArtifacts true -updatePodRepo true \
  -templateDir "${REPO}"/ZipBuilder/Template -localPodspecPath "${REPO}" \
  -outputDir "${OUTPUT_DIR}" -customSpecRepos https://github.com/firebase/SpecsStaging.git
