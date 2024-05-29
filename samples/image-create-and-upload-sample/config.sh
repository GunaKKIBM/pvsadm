# Copyright 2021 IBM Corp
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

API_KEY=""  #Api key value
RHEL_URL="" #Rhel qcow2 url [Get KVM Guest image url from https://access.redhat.com/downloads/content/279/ver=/rhel---8/8.3/ppc64le/product-software]
RHCOS_URL="" #Rhcos qcow2 url [Eg: https://mirror.openshift.com/pub/openshift-v4/ppc64le/dependencies/rhcos/4.6/latest/rhcos-4.6.8-ppc64le-openstack.ppc64le.qcow2.gz]
CENTOS_URL="" #Centos qcow2 url [Eg: https://cloud.centos.org/centos/8/ppc64le/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.ppc64le.qcow2]
RHEL_USERNAME="" #Rhel Username required for rhel image conversion
RHEL_PASSWORD="" #Rhel Password required for rhel image conversion
BUCKET_NAME="test-bucket" #Bucket name for uploading image. (Can be a new or an existing bucket)
BUCKET_REGION="us-south" #Region where the bucket is present
RESOURCE_GROUP="default" #Resource group required while uploading image
WORKSPACE_NAME="" #PVS workspace name where the image needs to be imported
