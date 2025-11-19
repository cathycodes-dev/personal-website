 ### 🚩 _DEVELOPMENT IN-PROGRESS_ 🚩

# Personal Website: cathycodes.com

This repository will contain the the initial infrastructure of my personal website, __www.cathycodes.com__. The site will be hosted on AWS and provisioned using Terraform with deployment handled by GitHub Actions. This project serves both as my professional website and as an example of my skills in cloud architecture, DevOps automation, and infrastructure management.

The intial version will be a static site that simply displays resume info, but in the future it will contain projects and demos as well.

## Overview

The infrastructure follows a serverless, scalable, and cost-efficient architecture that includes:

* **S3** for static website hosting
* **CloudFront** for global content delivery and HTTPS
* **Route 53** for domain management
* **GitHub Actions** for CI/CD
* **Terraform** for reproducible infrastructure provisioning

Additional projects and demos will be added to the site over time.

## Repository Structure

Initial Draft
```
.
├── README.md
├── hooks/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── modules/
│   │   ├── s3-website/
│   │   ├── cloudfront/
│   │   ├── route53/
├── site/
│   ├── index.html
│   ├── style.css
│   └── assets/
└── .github/
    └── workflows/
        └── deploy.yml
    
```

## Deployment Workflow

The automated deployment pipeline will work as follows

1. **Push changes** to the main branch
2. **GitHub Actions** runs
   * Terraform fmt, validate, init, plan, and apply
   * Uploads website content to S3
   * 
3. Site updates will be available at **[https://cathycodes.com](https://cathycodes.com)**

## Prerequisites

_TBD (will include Terraform, AWS CLI, and required GitHub secret variable names)_

## Future Goals

* Deploy project demos built in Python, FastAPI, pandas, or AWS data tooling
* Add small data engineering pipelines as interactive examples
* Add blog or documentation section

  
## About This Project

This repository reflects my experience with:

* Cloud infrastructure (AWS)
* Infrastructure as Code (Terraform)
* CI/CD automation (GitHub Actions)

Skills to be highlighted in future versions:
* Python development 
* Database management 
* Data engineering and pipeline design

It will continue to grow as I add new features and professional projects.