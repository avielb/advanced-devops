terraform {
  source = "git@github.com:identiq-protocol/edge-infrastructure.git//modules/aws/?ref=0.0.69"

}
inputs = {
  region = "us-east-1"
  external_redis                  = true
  external_db                     = true
}
