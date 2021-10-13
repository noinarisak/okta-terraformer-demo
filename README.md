# Okta :heart: Terraformer

Simple demos showcasing Okta and Terraformer( Reverse Terraform). The intended audience for this repo are for practitioners who are familiar with `Terraform` and Okta. Please review this [introduction on Terraform](https://www.terraform.io/intro/index.html) and of course more info on [Okta](https://developer.okta.com/) if you are not. My other [Okta Terraform Demo](https://github.com/noinarisak/okta-terraform-demo) is quick walk-through to get you started.

## Table of Contents

* [Pre-Req](#pre-req)
* [Quick Start](#quick-start)
* [More Information](#more-information)

## Pre Req

* Okta Tenant - Free Development tenant [here](https://developer.okta.com/).
* Terraform - Install docs [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) and introduction [here](https://www.terraform.io/intro/index.html).
* Terraformer - Install docs [here](https://github.com/GoogleCloudPlatform/terraformer#installation).
* (Optional) [tfenv](https://github.com/tfutils/tfenv) - Terraform Version Manager 🎉
* (Optional, but highly recommend) [dotenv](https://direnv.net/) - Best environment variable tool for command-line ninja.

## Quick Start

**NOTE**: Please review Terraformer Okta supported resources at the following [link](https://github.com/GoogleCloudPlatform/terraformer/blob/master/docs/okta.md). The contributors are continously adding and fixing resources to align in parity to the Terraform Okta Provider. Issues and feature request can be submitted on the main [repo](https://github.com/GoogleCloudPlatform/terraformer/issues).

### Tools

**NOTE**: It is subtle but names of the commandline tools are `terraform` and `terraformer` which are two commandline applicatons.

Validate install:

```bash
# Show version
$ terraform version

# Output
ie.
Terraform v1.0.9
on darwin_amd64
+ provider registry.terraform.io/okta/okta v3.15.0
...

# List of help details
$ terraform help
```

```bash
# Show version
$ terraformer -v

# Output
ie.
version v0.8.17
```


### Setup Steps for Demo

Setup a developer Okta Org and create a API Token.

1. Setup developer Okta Org at [developer.okta.com](https://developer.okta.com/).
2. Activate your Okta Org and then go to the Dashboard.
3. On the Dashboard screen, navigate `API` menu and select `Tokens`.
4. On the API screen, click `Create Token` and name your API Token.
5. Copy and store the generated token so you can use this `backend.config` file later.
6. Make note of your Okta Org url. (ie. `dev-302083.okta.com`) you need this later too.

Setting your commandline environment, which I'm using `direnv` and copy and update `.envrc.sample` to have `.envrc` file containing Okta information.

1. Validate `direnv` is installed.

```bash
$ direnv version

ie.
2.28.0
```

2. Copy and update the `.envrc.sample` file using your favorite editor. I'm using VIM.

```bash
$ cp .envrc.sample .envrc

$ vim .envrc

# Update the file, etc

# Should look similar to this.
$ cat .envrc
# Okta Tenent ie https://dev-1537305.okta.com or https://dev-1537305.oktapreview.com
export OKTA_API_TOKEN=00e...
export OKTA_ORG_NAME=dev-1537305
export OKTA_BASE_URL=okta.com
```

3. Now load environment variable to only this directory with `direnv` tool.

```bash
$ direnv allow .

# Output
ie.
direnv: loading /xdata/_prj/okta-terrafomer-demo/.envrc
direnv: export +OKTA_API_TOKEN +OKTA_BASE_URL +OKTA_ORG_NAME
```

This demo walk-through expects a existing Okta org/tenant that contains a few supporting resources like: Oauth/OIDC apps, users, groups, etc.

Prepare for extraction

1. Create `okta.tf` or use the only in this repo.

```bash
$ cat okta.tf

# Output
ie.
# This all you need to start with Terraformer to extract Okta resource from your Okta tenant.
terraform {
  required_providers {
    okta = {
      source  = "okta/okta",
      version = "~> 3.13"
    }
  }
}

provider "okta" {
}%
```

3. Install `terraform` binary and use verison that you installed. I will be using `tfenv` to do that.

```bash
# Install the terraform binary
$ tfenv install 1.0.9

# Set to the version that I installed
$ tfenv use 1.0.9
```

4. Initialized the Okta provider. (Basically, get the Okta provider binaries to working space).

```bash
$ terraform init
```

5. Finally, start extracting the Okta resource using the `terraformer` commandline tool into HCL and Terraform State file.

```bash
$ terrafomer import okta --resources=okta_user
```

6. Review. The above command by default will create a `generated` folder containing specific resource that you wanted extracted, in the example that was the `okta_user` resource.

``bash
$tree generated

# Output
ie.
generated
└── okta
    └── okta_user
        ├── outputs.tf
        ├── provider.tf
        ├── terraform.tfstate
        └── user.tf

2 directories, 4 files
```

## More Example

* Extract User and OAuth/OpenID Applications

```bash
$ terraformer import okta --resources=okta_user,okta_app_oauth
```

* Extract User, Groups, OAuth/OpenID Applications, and Authorization Server

```bash
$ terraformer import okta --resources=okta_user,okta_group,okta_app_oauth,okta_auth_server
```

## Issues/Bugs or Features

Please submit Issues/Bugs/Features using [GitHub Issues](https://github.com/noinarisak/okta-terraform-demo/issues) page and clicking on `New issue` button.

## More information

* Okta
  * [Developer.okta.com](https://developer.okta.com)
  * [Okta + Terraform](https://www.okta.com/blog/2019/08/better-together-using-the-okta-integration-with-hashicorp-terraform)
  * [Okta Terraform Demo Walkthrough](https://github.com/noinarisak/okta-terraform-demo) From me 😉

* Terraform
  * [Introduction to Terraform](https://www.terraform.io/intro/index.html)
  * [Terraform Tutorial](https://learn.hashicorp.com/terraform)
  * [Terraform Okta Provider](https://www.terraform.io/docs/providers/okta/index.html)
  * [Terraform Provider Ecosystem](https://www.terraform.io/docs/providers/index.html)
  * [Third-party Plugins Install](https://www.terraform.io/docs/configuration/providers.html#third-party-plugins)

* Other tools
  * [Terraform version manager](https://github.com/tfutils/tfenv)

* Additional Articles and Blogs
  * [Deeper walk-though with Okta + Terraform](https://github.com/articulate/terraform-provider-okta-demos) Many thanks to Articulate and [quantumew](https://github.com/quantumew) :tada:
  * [Better together using Okta Integration...](https://www.okta.com/blog/2019/08/better-together-using-the-okta-integration-with-hashicorp-terraform/)
  * [Managing Multiple Okta Instances with Terraform Cloud](https://developer.okta.com/blog/2020/02/03/managing-multiple-okta-instances-with-terraform-cloud)
