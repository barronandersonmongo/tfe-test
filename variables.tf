variable "public_key" {
  description = "MongoDB Atlas API public key"
  type        = string
  default     = "vxgroqbk"
}

variable "private_key" {
  description = "MongoDB Atlas API private key"
  type        = string
  sensitive   = true
  default     = "b63c061b-2ad3-46bc-916b-cc7f6d1db9da"
}

variable "project_id" {
  description = "MongoDB Atlas Project ID"
  type        = string
  default     = "5d13b8a5cf09a256dae39c96"
}

