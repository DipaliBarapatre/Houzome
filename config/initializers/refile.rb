# config/initializers/refile.rb
require "refile/s3"

Refile.host = "dfj85qshrbxxf.cloudfront.net"


aws = {
  access_key_id: "AKIAI7NKO52DJOS6KNEA",
  secret_access_key: "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",
  region: "ap-southeast-1",
  bucket: "houzome",
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
