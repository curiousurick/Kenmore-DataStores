#!/bin/bash
# Run xcodebuild for all targets.

base_path=$(git rev-parse --show-toplevel);

set -e

xcodebuild test -project "${base_path}/Kenmore-DataStores.xcodeproj" -scheme Kenmore-DataStores -destination 'platform=tvOS Simulator,name=Apple TV 4K (3rd generation),OS=18.1';

exit 0
