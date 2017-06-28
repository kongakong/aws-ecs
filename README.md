# Goal

Try out beanstalk, sqs and dockers


# ECR and docker


aws ecr get-login --region ap-southeast-2

docker build -t simplequeue .

docker tag simplequeue:latest 796668560264.dkr.ecr.ap-southeast-2.amazonaws.com/simplequeue:latest

docker push 796668560264.dkr.ecr.ap-southeast-2.amazonaws.com/simplequeue:latest

# Test docker images

docker run -ti simplequeue


# Add aws credential

## Use the template to create a `credentials` file and fill in details
cp credentials.template credentials


