#!/bin/bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

QUICKSTART_ROOT="$( cd "$(dirname "$0")" || exit >/dev/null 2>&1 ; pwd -P )"
export QUICKSTART_ROOT

source "$QUICKSTART_ROOT/steps.sh"

enable_all_apis

set_config_params

create_apigee_org

create_apigee_env "test"

create_apigee_envgroup "default"

add_env_to_envgroup "test" "default"

configure_network

create_gke_cluster

install_asm_and_certmanager

download_apigee_ctl

prepare_resources

create_sa

install_runtime

deploy_example_proxy