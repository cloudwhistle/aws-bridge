init:
	[ -f .env.aws ] || (touch .env.aws && echo \"export AWS_REGION=us-west-2\" >> .env.aws && echo \"export AWS_PROFILE=\" >> .env.aws && echo \"export AWS_PAGER=\"\"\" >> .env.aws)

setup: build
	source .env.aws && sam deploy --guided

build: init
	sam build

deploy: build
	source .env.aws && sam deploy --no-confirm-changeset

publish:
	source .env.aws && aws s3 cp template.yaml s3://cloudwhistle-bridge --acl public-read
