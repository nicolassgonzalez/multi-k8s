docker build -t nicolassgonzalez/multi-client-k8s:latest -t nicolassgonzalez/multi-client-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t nicolassgonzalez/multi-server-k8s-pgfix:latest -t nicolassgonzalez/multi-server-k8s-pgfix:$SHA -f ./server/Dockerfile ./server
docker build -t nicolassgonzalez/multi-worker-k8s:latest -t nicolassgonzalez/multi-worker-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push nicolassgonzalez/multi-client-k8s:latest
docker push nicolassgonzalez/multi-server-k8s-pgfix:latest
docker push nicolassgonzalez/multi-worker-k8s:latest

docker push nicolassgonzalez/multi-client-k8s:$SHA
docker push nicolassgonzalez/multi-server-k8s-pgfix:$SHA
docker push nicolassgonzalez/multi-worker-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=nicolassgonzalez/multi-server-k8s-pgfix:$SHA
kubectl set image deployments/client-deployment client=nicolassgonzalez/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=nicolassgonzalez/multi-worker-k8s:$SHA