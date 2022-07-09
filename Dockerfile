FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install apt-utils -y \
    wget \
    curl \
    vim \
    unzip \
    git 

### AWS CLI INSTALLATIN
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf awscliv2.zip \
    && rm -rf aws

### TERRAFORM INSTALLATIN
ENV TERRAFORM_VERSION 1.0.0
WORKDIR /tmp
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin \
    && rm -f terraform terraform_${TERRAFORM_VERSION}_linux_amd64.zip

### TERRAGRUNT INSTALLATIN
ENV TERRAGRUNT_VERSION v0.26.7
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && mv terragrunt_linux_amd64 terragrunt \
    && chmod u+x terragrunt \
    && mv terragrunt /usr/local/bin/terragrunt

