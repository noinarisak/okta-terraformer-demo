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

## Quick Start

**NOTE**: Please review Terraformer Okta supported resources at the following [link](https://github.com/GoogleCloudPlatform/terraformer/blob/master/docs/okta.md). The contributors are continously adding and fixing resources to align in parity to the Terraform Okta Provider. Issues and feature request can be submitted on the main [repo](https://github.com/GoogleCloudPlatform/terraformer/issues).

### Tools

**NOTE**: It is subtle but names of the commandline tools are `terraform` and `terraformer` which are two commandline applicatons.

Validate install:

```bash
# Show version
$ terraform version

ie.
Terraform v1.x.x
...

# List help details
$ terraform help
```

```bash
# Show version
$ terraformer -v

ie.
version v0.8.x
```


### Setup Steps for Demo

Setup a developer Okta Org and create a API Token.

1. Setup developer Okta Org at [developer.okta.com](https://developer.okta.com/).
2. Activate your Okta Org and then go to the Dashboard.
3. On the Dashboard screen, navigate `API` menu and select `Tokens`.
4. On the API screen, click `Create Token` and name your API Token.
5. Copy and store the generated token so you can use this `backend.config` file later.
6. Make note of your Okta Org url. (ie. `dev-302083.okta.com`) you need this later too.

This demo walkthrough expects a existing Okta org/tenant that contains a few supporting resources like: Oauth/OIDC apps, users, groups, etc.

## Example Demos

* WIP

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
