# Infrastructure code for a typical environment with frontend, backend and RDS
## Description of our environment
### ui

A user interface served as static files

image: acme/ui
domain: www.acme.com
port: 80/443
exposed to the internet: yes

### api

A stateless RESTful API server to which the UI connects to get data
image: acme/api
domain: api.acme.com
port: 443
exposed to the internet: yes
expected env vars:
POSTGRES_URL: url of the postgres instance
METRICS_URL: url of the prometheus instance

### db

A PostgreSQL database
port: 5432
exposed to the internet: no

### metrics
A prometheus container collecting metrics
port: 80
exposed to the internet: no

## Configure access to AWS account

The recommended way to configure access credentials to AWS account is using environment variables:

```
$ export AWS_DEFAULT_REGION=us-east-1
$ export AWS_ACCESS_KEY_ID=...
$ export AWS_SECRET_ACCESS_KEY=...
```


## Create and manage your infrastructure

Infrastructure consists of multiple layers (rds, autoscaling_2, autoscaling_1, ...) where each layer is described using one [Terraform module](https://www.terraform.io/docs/configuration/modules.html) with `inputs` arguments specified in `terragrunt.hcl` in respective layer's directory.

Navigate through layers to review and customize values inside `inputs` block.

There are two ways to manage infrastructure (slower&complete, or faster&granular):
- **Region as a whole (slower&complete).** Run this command to create infrastructure in all layers in a single region:

```
$ cd us-east-1
$ terragrunt apply-all
```

- **As a single layer (faster&granular).** Run this command to create infrastructure in a single layer (eg, `rds`):

```
$ cd us-east-1/rds
$ terragrunt apply
```

After the confirmation your infrastructure should be created.


 