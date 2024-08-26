docker run --name master -d ubuntu sleep 1000000
docker run --name node1 avielb/ansible-demo:arm64 
docker run --name node2 avielb/ansible-demo:arm64 
