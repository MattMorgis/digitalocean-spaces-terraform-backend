# DigitalOcean Spaces as a Terraform Backend

Demonstrates how to use [DigitalOcean Spaces](https://www.digitalocean.com/products/spaces/) as a [Terraform Backend](https://www.terraform.io/docs/backends/index.html).

DigitalOcean Spaces are `S3` compatible, making the large ecosystem of `S3` tools and libraries available.

## Prerequisites

- Create a `Space` via the DigitalOcean console or CLI
- A Spaces `Access Key` and `Secret`
- The [`aws cli`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) installed
- _Optional:_ A DigitalOcean personal access token (used to create an example Droplet)

## Setup

We can use the [`S3`](https://www.terraform.io/docs/backends/types/s3.html) Terraform Backend to instead point to our `Space`.

The required keys are `endpoint`, `key`, and `bucket`.

- `endpoint`: Available in the Settings of your `Space`.
- `key`: path and name of `.tfstate` file that will be written
- `bucket`: the name of your `Space`

```hcl
terraform {
  backend "s3" {
    endpoint                    = "sfo2.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "rappiddev-terraform-remote-state"
    region                      = "us-west-1"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
  }
}
```

## Authentication

Terraform uses the standard `.aws/credentials` file to authenticate to the `S3` backend. This is created by the `aws cli`.

We can use [named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) to create one to access DigitalOcean Spaces.

```bash
aws configure --profile digitalocean
```

You can tell the `aws cli` (and the `terraform` command by extension) which profile to use by setting the `AWS_PROFILE` environment variable.

```bash
export AWS_PROFILE=digitalocean
```

Verify it's set:

```
echo $AWS_PROFILE
```

## Initialize Backend

Once your named profile is configured and your shell knows which profile to use, Terraform can initialize.

```bash
terraform init
```

If all goes well you should see:

```bash
Terraform has been successfully initialized!
```

## Optional: Create a Droplet

Set environment variable `DIGITALOCEAN_TOKEN` with a DigitalOcean Personal Access Token:

```bash
export DIGITALOCEAN_TOKEN="YOUR API TOKEN"
```

Create a \$5/month Ubuntu Droplet:

```bash
terraform plan
terraform destroy
```

To delete the Droplet:

```
terraform destroy
```
