# Copyright 2024 Cloudera, Inc. All Rights Reserved.
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

# ---------------------------------------------------------------------------------------------------------------------
# AWS Provider Configuration
# ---------------------------------------------------------------------------------------------------------------------
# The AWS provider can be configured using environment variables:
#   AWS_ACCESS_KEY_ID     - AWS access key
#   AWS_SECRET_ACCESS_KEY - AWS secret key
#   AWS_REGION            - AWS region
# Or via the provider block below
# ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region

  # Ignore tags created by data services
  ignore_tags {
    key_prefixes = ["kubernetes.io/cluster"]
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CDP Provider Configuration
# ---------------------------------------------------------------------------------------------------------------------
# The CDP provider can be configured using environment variables:
#   CDP_ACCESS_KEY_ID     - CDP access key
#   CDP_PRIVATE_KEY       - CDP private key
#   CDP_PROFILE           - CDP profile name (optional)
# Or via the provider block below (not recommended for production)
# ---------------------------------------------------------------------------------------------------------------------

# CDP Provider is configured via environment variables by default
