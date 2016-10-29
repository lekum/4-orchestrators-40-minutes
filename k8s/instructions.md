# How to deploy the cluster

1. Run `vagrant up`

2. In the first node (`vagrant ssh server`) run:

  `kubeadm init --api-advertise-addresses=10.0.15.21`

   Wait until it finishes and outputs the `kubeadm join` command.

3. Edit the file `/etc/kubernetes/kube-apiserver.json` and, for example, before `"--etcd-servers=http://127.0.0.1:2379` put this line:

  `"--advertise-address=10.0.15.21",`

4. Run `kubectl -n kube-system edit ds kube-proxy-amd64 && kubectl -n kube-system delete pods -l name=kube-proxy-amd64` and edit the file so that there is an option `--proxy-mode=userspace` in the command line of the `kube-proxy`

5. Enter servers 2 and 3 and run the `kubeadm join...` command that you have got at the end of step 2

6. On server1, run `kubectl apply -f https://git.io/weave-kube`

7. Run `kubectl get pods --all-namespaces` and wait until every component in in `Running` state

