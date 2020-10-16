##############################################################################
# Account Variables
##############################################################################

variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
  type        = string
}

variable unique_id {
    description = "A unique identifier need to provision resources. Must begin with a letter"
    type        = string
    default     = "asset-multizone"
}

variable ibm_region {
    description = "IBM Cloud region where all resources will be deployed"
    type        = string
}

variable resource_group {
    description = "Name of resource group to create VPC"
    type        = string
    default     = "asset-development"
}

variable generation {
  description = "generation for VPC. Can be 1 or 2"
  #type        = number
  default     = 2
}

##############################################################################


##############################################################################
# Network variables
##############################################################################

variable classic_access {
  description = "Enable VPC Classic Access. Note: only one VPC per region can have classic access"
  #type        = bool
  default     = false
}

variable enable_public_gateway {
  description = "Enable public gateways for subnets, true or false"
  #type        = bool
  default     = true
}

variable cidr_blocks {
  description = "A list of tier subnet CIDR blocks"
  type        = list //(string)
  default     = [
    "10.10.10.0/24",
    "10.10.20.0/24",
    "10.10.30.0/24"
  ] 
}

variable acl_rules {
  description = "Access control list rule set"
  default = [
    {
      name        = "egress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "inbound"
    },
    {
      name        = "ingress"
      action      = "allow"
      source      = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      direction   = "outbound"
    }
  ]
  
}

variable default_sg_allow_inbound_traffic {
  description = "In Gen2 the default security group denies all inbound traffic into the VPC. If you would like to add a rule to allow all traffic, change this value to true"
  type        = bool
  default     = false
}

##############################################################################