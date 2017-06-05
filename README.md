Goal:

Try out beanstalk, sqs and dockers


ECR:


aws ecr get-login --region ap-southeast-2

docker build -t simplequeue .

docker tag simplequeue:latest 796668560264.dkr.ecr.ap-southeast-2.amazonaws.com/simplequeue:latest

docker push 796668560264.dkr.ecr.ap-southeast-2.amazonaws.com/simplequeue:latest
