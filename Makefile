init:
	[ -f .env.aws ] || (touch .env.aws && echo \"export AWS_REGION=us-west-2\" >> .env.aws && echo \"export AWS_PROFILE=\" >> .env.aws && echo \"export AWS_PAGER=\"\"\" >> .env.aws)

build:
	sam build

setup: init build
	source .env.aws && sam deploy --guided

deploy: init build
	source .env.aws && sam deploy --no-confirm-changeset
